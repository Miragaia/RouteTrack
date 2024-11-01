import 'package:google_maps_routes/google_maps_routes.dart';
import 'package:routertrack/bloc/route_creation/route_creation_bloc.dart';
import 'package:routertrack/bloc/route_creation/route_creation_state.dart';
import 'package:routertrack/mycolors/colors.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../dto/route_item_dto.dart';
import '../location/determine_position.dart';
import '../repository/route_repository.dart';

class RoutesMap extends StatefulWidget{
  const RoutesMap({
    super.key,
  });

  @override
  State<RoutesMap> createState() => _RoutesMapState();
}

class _RoutesMapState extends State<RoutesMap> {
  Uuid uuid = const Uuid();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final MapsRoutes route = MapsRoutes();
  late GoogleMapController _googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  VoidCallback? followStoreLink;

  static const CameraPosition _kEurope = CameraPosition(
    target: LatLng(49.647714, 4.180428),
    zoom: 4.2,
  );

  Future<void> _drawRoute(RouteState state) async {
    List<LatLng> routeCoordinates = state.routeItemEntries
        .map((entry) => LatLng(entry.routeItem.latitude, entry.routeItem.longitude))
        .toList();
    for (int i = 0; i < routeCoordinates.length - 1; i++) {
      LatLng start = routeCoordinates[i];
      LatLng end = routeCoordinates[i + 1];

      await route.drawRoute(
        [start, end], // Create a route between the start and end points
        "Segment Route ${i + 1}",
        MyColorPalette.darkGreen,
        "AIzaSyBSGX8IRUDf0JIDgg2ShwvFMEX-Kn9cbbA",
        travelMode: TravelModes.walking,
      );
    }
    setState(() { });
  }

  Future<void> _initRoute(RouteState state) async {
    for (RouteItemEntry entry in state.routeItemEntries){
      RouteItemDTO routeItemDTO = entry.routeItem;
      LatLng routeItemLatLng = LatLng(routeItemDTO.latitude, routeItemDTO.longitude);
      MarkerId markerId = MarkerId(uuid.v4());
      markers[markerId] = Marker(
        markerId: markerId,
        position: routeItemLatLng,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: routeItemDTO.title,
          snippet: routeItemDTO.description,
        ),
      );
      markers = Map<MarkerId, Marker>.from(markers);
    }
    setState(() {});
    await _drawRoute(state);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    final state = context.read<RouteCreationBloc>().state;
    _initRoute(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RouteCreationBloc, RouteState>(
      listenWhen: (previousState, state) {
        return [
          RouteStateCreated,
          RouteStateRepeated,
          RouteStateCleared,
        ].contains(state.runtimeType);
      },
      listener: (context, state) async {
        if (state is RouteStateCreated){
          RouteItemDTO routeItemDTO = state.lastAddedEntry.routeItem;
          LatLng routeItemLatLng = LatLng(routeItemDTO.latitude, routeItemDTO.longitude);
          MarkerId markerId = MarkerId(uuid.v4());
          markers[markerId] = Marker(
            markerId: markerId,
            position: routeItemLatLng,
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: routeItemDTO.title,
              snippet: routeItemDTO.description,
            ),
          );
          LatLngBounds _createBounds(List<LatLng> positions) {
            final southwestLat = positions.map((p) => p.latitude).reduce((value, element) => value < element ? value : element); // smallest
            final southwestLon = positions.map((p) => p.longitude).reduce((value, element) => value < element ? value : element);
            final northeastLat = positions.map((p) => p.latitude).reduce((value, element) => value > element ? value : element); // biggest
            final northeastLon = positions.map((p) => p.longitude).reduce((value, element) => value > element ? value : element);
            final latRange = northeastLat - southwestLat;
            return LatLngBounds(
                southwest: LatLng(southwestLat - latRange, southwestLon),
                northeast: LatLng(northeastLat, northeastLon)
            );
          }
          LatLngBounds _bounds(Set<Marker> markers) {
            return _createBounds(markers.map((m) => m.position).toList());
          }
          markers = Map<MarkerId, Marker>.from(markers);
          _googleMapController.animateCamera(CameraUpdate.newLatLngBounds(
            _bounds(markers.values.toSet()), 50
          ));
          setState(() {});
          await _drawRoute(state);
        } else if (state is RouteStateRepeated){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Cannot add repeated route point!"),
            padding: EdgeInsets.all(20),
            backgroundColor: Color.fromARGB(255, 206, 32, 41)
          ));
        }else if (state is RouteStateCleared){
          List<MarkerId> markerIdsToRemove = [];
          markers.removeWhere((markerId, marker) => !["Origin", "Destination"].contains(
              marker.infoWindow.title
          ));
          route.routes.clear();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Route Cleared Successfully!"),
            padding: EdgeInsets.all(20),
            backgroundColor: MyColorPalette.darkGreen,
          ));
        }
        setState(() {});
      },
      child: FutureBuilder(
          future: determinePosition(),
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            return Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: _kEurope,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      _googleMapController = controller;
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    mapToolbarEnabled: false,
                    markers: Set<Marker>.of(markers.values),
                    polylines: route.routes,
                  ),
                  Positioned(
                    left: 12,
                    top: 40,
                    child: IconButton.filledTonal(
                        padding: const EdgeInsets.only(right: 3),
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.7),
                        )
                    ),
                  ),
                  Positioned(
                      right: 12,
                      top: 40,
                      child: IconButton.filled(
                        onPressed: () {
                          if (snapshot.hasData){
                            Position? currentLocation = snapshot.data;
                            _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                              bearing: 0,
                              target: LatLng(currentLocation!.latitude, currentLocation.longitude),
                              zoom: 17.0,
                            )));
                          }
                        },
                        icon: const Icon(Icons.near_me_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.7),
                        ),
                      )
                  ),
                ]
            );
          }
      ),
    );
  }
}