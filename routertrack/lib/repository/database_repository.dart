import 'dart:ui';

import 'package:routertrack/database/database.dart';

class RoutePersistenceRepository {
  AppDatabase database = AppDatabase();


  Future<void> addRouteWithPointsOfInterest(List<PointsOfInterestsCompanion> pointsOfInterest) async {

    print("READING");
    print(await database.select(database.routes).get());
    print(await database.select(database.pointsOfInterests).get());
    print(await database.select(database.pointsOfInterestRoutesEntries).get());
    print("INSERTING");

    await database.transaction(() async {
      // Add Points of Interest (can't use insertAll because of needing the id's)
      List<int> pointsOfInterestIds = [];
      for (PointsOfInterestsCompanion pointOfInterest in pointsOfInterest){
        int id = await database.into(database.pointsOfInterests).insert(pointOfInterest);
        pointsOfInterestIds.add(id);
      }

      // Add Route
      int routeId = await database.into(database.routes).insert(RoutesCompanion.insert());

      // Add Points of Interest to Route Entries (can't use insertAll because of needing the id's)
      for (int id in pointsOfInterestIds){
        await database.into(database.pointsOfInterestRoutesEntries).insert(PointsOfInterestRoutesEntriesCompanion.insert(
          pointOfInterestId: id,
          routeId: routeId,
        ));
      }

    });
    print("READING AGAIN");
    print(await database.select(database.routes).get());
    print(await database.select(database.pointsOfInterests).get());
    print(await database.select(database.pointsOfInterestRoutesEntries).get());
  }
}