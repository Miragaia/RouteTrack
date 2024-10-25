import 'dart:collection';
import '../bloc/route_creation/route_item_dto.dart';

final class PointsOfInterestEntry extends LinkedListEntry<PointsOfInterestEntry>{
  final RouteItemDTO routeItem;

  PointsOfInterestEntry(this.routeItem);

  @override
  String toString() {
    return routeItem.toString();
  }
}

class RouteRepository {

  final LinkedList<PointsOfInterestEntry> routeItemEntries = LinkedList<PointsOfInterestEntry>();

  RouteRepository(
      RouteItemDTO origin,
      RouteItemDTO destination,
  ) {
    routeItemEntries.add(PointsOfInterestEntry(origin));
    routeItemEntries.add(PointsOfInterestEntry(destination));
  }

  Stream<RouteItemDTO> getRouteItemEntries() {
    return Stream.fromIterable(routeItemEntries.map((entry) => entry.routeItem));
  }

  void addRouteItemEntry(PointsOfInterestEntry pointOfInterestEntry){
    routeItemEntries.last.insertBefore(pointOfInterestEntry);
  }

  void removeRouteItemEntry(PointsOfInterestEntry pointOfInterestEntry){
    pointOfInterestEntry.unlink();
  }

  void clearIntermediateRouteItemEntries(){
    // clear all but the first and last
    while(routeItemEntries.length > 2){
      routeItemEntries.first.next?.unlink();
    }
  }

}