import 'dart:collection';
import '../dto/route_item_dto.dart';
import '../database/database.dart';

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
  AppDatabase database = AppDatabase();

  RouteCreationRepository(
      RouteItemDTO origin,
      RouteItemDTO destination,
  ) {
    routeItemEntries.add(RouteItemEntry(origin));
    routeItemEntries.add(RouteItemEntry(destination));
  }

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