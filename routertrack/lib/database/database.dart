import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class PointsOfInterests extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(max: 64)();
  TextColumn get description => text().withLength(max: 128)();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
}

class Routes extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get creationDate => dateTime().withDefault(Constant(DateTime.now()))();
}

class PointsOfInterestRoutesEntries extends Table {
  // PointsOfInterest -- MxN -- Routes
  IntColumn get pointOfInterestId => integer().references(PointsOfInterests, #id)();
  IntColumn get routeId => integer().references(Routes, #id)();
}

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
}


@DriftDatabase(
  tables: [PointsOfInterests, Routes, PointsOfInterestRoutesEntries, Users],
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

}

