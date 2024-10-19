import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:routertrack/bloc/search_location_bloc.dart';
import 'package:routertrack/widgets/modal_bottom_sheet.dart';


class RoutesMap extends StatefulWidget{
  const RoutesMap({
    super.key,
  });

  @override
  State<RoutesMap> createState() => _RoutesMapState();
}

class _RoutesMapState extends State<RoutesMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late GoogleMapController _googleMapController;
  final ClusterManagerId clusterManagerId = const ClusterManagerId("stores");
  late ClusterManager clusterManager;
  final Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late SearchLocationBloc searchLocationBloc;
  // Getting the following error
  bool isButtonVisible = false;
  VoidCallback? followStoreLink;

  static const CameraPosition _kEurope = CameraPosition(
    target: LatLng(49.647714, 4.180428),
    zoom: 4.2,
  );

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

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

    BlocListener<SearchLocationBloc, LatLng> (
      listener: (context, state) {
        print("callbacking this $state");
        _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          bearing: 0,
          target: state,
          zoom: 17.0,
        )));
      },
    );

    return BlocListener<SearchLocationBloc, LatLng>(
      listener: (context, state) {
        print("callbacking this $state");
        _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          bearing: 0,
          target: state,
          zoom: 17.0,
        )));
      },
      child: FutureBuilder(
          future: _determinePosition(),
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