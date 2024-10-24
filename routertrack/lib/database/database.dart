import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category =>
      integer().nullable().references(TodoCategory, #id)();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class TodoCategory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}


class PointsOfInterests extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
}

class Routes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  DateTimeColumn get creationDate => dateTime().withDefault(Constant(DateTime.now()))();
}

class PointsOfInterestRoutesEntries extends Table {
  // PointsOfInterest -- MxN -- Routes
  IntColumn get pointOfInterestId => integer().references(PointsOfInterests, #id)();
  IntColumn get routeId => integer().references(Routes, #id)();
}

class Trips extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  DateTimeColumn get creationDate => dateTime().withDefault(Constant(DateTime.now()))();
  // Foreign Keys
  // Route -- 1xN -- Trips
  // User -- 1xN -- Trips
  IntColumn get routeId => integer().references(Routes, #id)();
  IntColumn get userId => integer().references(Users, #id)();
}

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
}


@DriftDatabase(
  tables: [PointsOfInterests, Routes, PointsOfInterestRoutesEntries, Trips, Users, TodoItems, TodoCategory],
)
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a schemaVersion getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/getting-started/#open
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // driftDatabase from package:drift_flutter stores the database in
    // getApplicationDocumentsDirectory().
    return driftDatabase(name: 'my_database');
  }

  Stream<List<Trip>> usersTrips(Users user) {
    return (
        select(trips)
          ..where((trip) => trip.userId.equals(user.id as int))
    ).watch();
  }


}
