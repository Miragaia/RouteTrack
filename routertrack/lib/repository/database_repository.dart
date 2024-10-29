import 'package:drift/drift.dart';
import 'package:routertrack/database/database.dart';
import 'package:routertrack/dto/route_with_points_dto.dart';
import 'package:collection/collection.dart';

class RoutePersistenceRepository {
  AppDatabase db = AppDatabase();

  Future<void> addRouteWithPointsOfInterest(List<PointsOfInterestsCompanion> pointsOfInterest) async {
    await db.transaction(() async {
      // Add Points of Interest (can't use insertAll because of needing the id's)
      List<int> pointsOfInterestIds = [];
      for (PointsOfInterestsCompanion pointOfInterest in pointsOfInterest){
        int id = await db.into(db.pointsOfInterests).insert(pointOfInterest);
        pointsOfInterestIds.add(id);
      }

      // Add Route
      int routeId = await db.into(db.routes).insert(RoutesCompanion.insert());

      // Add Points of Interest to Route Entries (can't use insertAll because of needing the id's)
      for (int id in pointsOfInterestIds){
        await db.into(db.pointsOfInterestRoutesEntries).insert(PointsOfInterestRoutesEntriesCompanion.insert(
          pointOfInterestId: id,
          routeId: routeId,
        ));
      }
    });
  }

  Stream<List<RouteWithPoints>> watchRoutes() {
    print("TESTING HERE");

    return db.select(db.routes).join([
      innerJoin(
        db.pointsOfInterestRoutesEntries,
        db.pointsOfInterestRoutesEntries.routeId.equalsExp(db.routes.id),
      ),
      innerJoin(
        db.pointsOfInterests,
        db.pointsOfInterests.id.equalsExp(db.pointsOfInterestRoutesEntries.pointOfInterestId),
      )
    ]).watch().map((rows) {
      final groupedRoutes = groupBy(rows, (row) => row.readTable(db.routes));

      return groupedRoutes.entries.map((entry) {
        return RouteWithPoints(
          route: entry.key,
          pointsOfInterest: entry.value.map((row) => row.readTable(db.pointsOfInterests)).toList(),
        );
      }).toList();
    });
  }

}