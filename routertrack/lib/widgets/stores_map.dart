import 'package:routertrack/bloc/route_creation/route_creation_bloc.dart';
import 'package:routertrack/bloc/route_creation/route_creation_state.dart';
import 'package:routertrack/repository/route_repository.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:routertrack/bloc/search_location_bloc.dart';
import 'package:routertrack/widgets/route_bottom_sheet.dart';

import '../dto/route_item_dto.dart';
import '../location/determine_position.dart';


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
  late GoogleMapController _googleMapController;
  final ClusterManagerId clusterManagerId = const ClusterManagerId("stores");
  late ClusterManager clusterManager;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late SearchLocationBloc searchLocationBloc;
  // Getting the following error
  bool isButtonVisible = false;
  VoidCallback? followStoreLink;

  static const CameraPosition _kEurope = CameraPosition(
    target: LatLng(49.647714, 4.180428),
    zoom: 4.2,
  );

  @override
  void initState() {
    super.initState();
    searchLocationBloc = BlocProvider.of<SearchLocationBloc>(context);
    clusterManager = ClusterManager(
      clusterManagerId: clusterManagerId,
      onClusterTap: (Cluster cluster) async {
        double zoom = await _googleMapController.getZoomLevel();
        double newZoom = zoom < 11 ? 11 : zoom + 2;
        debugPrint('Zoom: $zoom');
        debugPrint('New Zoom: $newZoom');
        searchLocationBloc.add(SearchLocationEvent(cluster.position));
        // _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        //   bearing: 0,
        //   target: cluster.position,
        //   zoom: newZoom,
        // )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RouteCreationBloc, RouteState>(
      listenWhen: (previousState, state) {
        return [RouteStateCreated, RouteStateCleared].contains(state.runtimeType);
      },
      listener: (context, state) {
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

          // _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          //   bearing: 0,
          //   target: routeItemLatLng,
          //   zoom: 17.0,
          // )));
        } else if (state is RouteStateCleared){
          markers = <MarkerId, Marker>{};
        }
        setState(() {});
      },
      child: FutureBuilder(
          future: determinePosition(),
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            CameraPosition kCurrentPosition;
            if (snapshot.hasData){
              Position? position = snapshot.data;
              kCurrentPosition = CameraPosition(
                target: LatLng(position!.latitude, position.longitude),
                zoom: 14.4746,
              );
            }
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
                    clusterManagers: <ClusterManager>{clusterManager},
                    onTap: (LatLng latLng) {
                      setState(() {
                        isButtonVisible = false;
                      });
                    },
                  ),
                  AnimatedPositioned(
                    right: isButtonVisible ? 10 : -100,
                    bottom: 56,
                    duration: const Duration(milliseconds: 500),
                    child: IconButton.filled(
                      onPressed: () => followStoreLink!(),
                      icon: const Icon(Icons.shopping_bag_outlined,
                        color: Colors.green,
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
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
                      right: 15,
                      bottom: 100,
                      child: IconButton.filled(
                        onPressed: () {
                          if (snapshot.hasData){
                            Position? currentLocation = snapshot.data;
                            // _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                            //   bearing: 0,
                            //   target: LatLng(currentLocation!.latitude, currentLocation.longitude),
                            //   zoom: 17.0,
                            // )));
                            searchLocationBloc.add(SearchLocationEvent(LatLng(currentLocation!.latitude, currentLocation.longitude)));
                          }
                        },
                        icon: const Icon(Icons.near_me_outlined,
                          color: Colors.green,
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