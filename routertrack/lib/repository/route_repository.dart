import 'dart:collection';
import 'dart:ui';

import 'package:routertrack/database/database.dart';

final class PointsOfInterestEntry extends LinkedListEntry<PointsOfInterestEntry>{
  final PointsOfInterest pointsOfInterest;

  PointsOfInterestEntry(this.pointsOfInterest);

  @override
  String toString() {
    return pointsOfInterest.toString();
  }
}

class RouteRepository {

  final LinkedList<PointsOfInterestEntry> pointsOfInterestLinkedList = LinkedList<PointsOfInterestEntry>();

  RouteRepository(
      PointsOfInterest origin,
      PointsOfInterest destination,
  ) {
    pointsOfInterestLinkedList.add(PointsOfInterestEntry(origin));
    pointsOfInterestLinkedList.add(PointsOfInterestEntry(destination));
  }

  Stream<PointsOfInterest> getPointsOfInterest() {
    return Stream.fromIterable(pointsOfInterestLinkedList.map((entry) => entry.pointsOfInterest));
  }

  void addPointOfInterestEntry(PointsOfInterest pointsOfInterest){
    pointsOfInterestLinkedList.last.insertBefore(PointsOfInterestEntry(pointsOfInterest));
  }

  void removePointOfInterestEntry(PointsOfInterestEntry pointOfInterestEntry){
    pointOfInterestEntry.unlink();
  }

  void clearPointsOfInterestEntries(){
    pointsOfInterestLinkedList.clear();
  }

}