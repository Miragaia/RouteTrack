import 'dart:collection';
import 'package:geolocator/geolocator.dart';

import '../dto/route_item_dto.dart';
import '../location/determine_position.dart';

final class RouteItemEntry extends LinkedListEntry<RouteItemEntry>{
  final RouteItemDTO routeItem;

  RouteItemEntry(this.routeItem);

  @override
  String toString() {
    return routeItem.toString();
  }
}

class RouteCreationRepository {
  final LinkedList<RouteItemEntry> routeItemEntries = LinkedList<RouteItemEntry>();

  static Future<RouteCreationRepository> create() async {
    final routeCreationRepository = RouteCreationRepository();
    await determinePosition()
      .then((position) {
        routeCreationRepository.routeItemEntries.add(RouteItemEntry(RouteItemDTO(
            title: "Origin",
            description: "Your Current Location: ${position.latitude}, ${position.longitude}",
            latitude: position.latitude,
            longitude: position.longitude
        )));
        routeCreationRepository.routeItemEntries.add(RouteItemEntry(RouteItemDTO(
            title: "Destination",
            description: "Your Current Location ${position.latitude}, ${position.longitude}",
            latitude: position.latitude,
            longitude: position.longitude
        )));
      }).catchError((error) {
        routeCreationRepository.routeItemEntries.add(RouteItemEntry(const RouteItemDTO(
            title: "Origin",
            description: "Your Current Location: 40.629540, -8.657072",
            latitude: 40.629540,
            longitude: -8.657072
        )));
        routeCreationRepository.routeItemEntries.add(RouteItemEntry(const RouteItemDTO(
            title: "Destination",
            description: "Your Current Location , -8.657072",
            latitude: 40.629540,
            longitude: -8.657072
        )));
      });
    return routeCreationRepository;
  }

  RouteCreationRepository();

  Stream<RouteItemDTO> getRouteItemEntries() {
    return Stream.fromIterable(routeItemEntries.map((entry) => entry.routeItem));
  }

  void addRouteItemEntry(RouteItemEntry pointOfInterestEntry){
    routeItemEntries.last.insertBefore(pointOfInterestEntry);
  }

  void removeRouteItemEntry(RouteItemEntry pointOfInterestEntry){
    pointOfInterestEntry.unlink();
  }

  void clearIntermediateRouteItemEntries(){
    // clear all but the first and last
    while(routeItemEntries.length > 2){
      routeItemEntries.first.next?.unlink();
    }
  }

  void replaceAllRouteItemEntries(List<RouteItemEntry> newRouteItemEntries) {
    routeItemEntries.clear();
    for (RouteItemEntry routeItemEntry in newRouteItemEntries){
      routeItemEntries.add(routeItemEntry);
    }
  }

}