// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PointsOfInterestsTable extends PointsOfInterests
    with TableInfo<$PointsOfInterestsTable, PointsOfInterest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointsOfInterestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, latitude, longitude];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'points_of_interests';
  @override
  VerificationContext validateIntegrity(Insertable<PointsOfInterest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PointsOfInterest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PointsOfInterest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
    );
  }

  @override
  $PointsOfInterestsTable createAlias(String alias) {
    return $PointsOfInterestsTable(attachedDatabase, alias);
  }
}

class PointsOfInterest extends DataClass
    implements Insertable<PointsOfInterest> {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  const PointsOfInterest(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    return map;
  }

  PointsOfInterestsCompanion toCompanion(bool nullToAbsent) {
    return PointsOfInterestsCompanion(
      id: Value(id),
      name: Value(name),
      latitude: Value(latitude),
      longitude: Value(longitude),
    );
  }

  factory PointsOfInterest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointsOfInterest(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
    };
  }

  PointsOfInterest copyWith(
          {int? id, String? name, double? latitude, double? longitude}) =>
      PointsOfInterest(
        id: id ?? this.id,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
  PointsOfInterest copyWithCompanion(PointsOfInterestsCompanion data) {
    return PointsOfInterest(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PointsOfInterest(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, latitude, longitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointsOfInterest &&
          other.id == this.id &&
          other.name == this.name &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude);
}

class PointsOfInterestsCompanion extends UpdateCompanion<PointsOfInterest> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> latitude;
  final Value<double> longitude;
  const PointsOfInterestsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
  });
  PointsOfInterestsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double latitude,
    required double longitude,
  })  : name = Value(name),
        latitude = Value(latitude),
        longitude = Value(longitude);
  static Insertable<PointsOfInterest> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? latitude,
    Expression<double>? longitude,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    });
  }

  PointsOfInterestsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? latitude,
      Value<double>? longitude}) {
    return PointsOfInterestsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointsOfInterestsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }
}

class $RoutesTable extends Routes with TableInfo<$RoutesTable, Route> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
      'creation_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, name, creationDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routes';
  @override
  VerificationContext validateIntegrity(Insertable<Route> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Route map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Route(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      creationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}creation_date'])!,
    );
  }

  @override
  $RoutesTable createAlias(String alias) {
    return $RoutesTable(attachedDatabase, alias);
  }
}

class Route extends DataClass implements Insertable<Route> {
  final int id;
  final String name;
  final DateTime creationDate;
  const Route(
      {required this.id, required this.name, required this.creationDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['creation_date'] = Variable<DateTime>(creationDate);
    return map;
  }

  RoutesCompanion toCompanion(bool nullToAbsent) {
    return RoutesCompanion(
      id: Value(id),
      name: Value(name),
      creationDate: Value(creationDate),
    );
  }

  factory Route.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Route(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'creationDate': serializer.toJson<DateTime>(creationDate),
    };
  }

  Route copyWith({int? id, String? name, DateTime? creationDate}) => Route(
        id: id ?? this.id,
        name: name ?? this.name,
        creationDate: creationDate ?? this.creationDate,
      );
  Route copyWithCompanion(RoutesCompanion data) {
    return Route(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      creationDate: data.creationDate.present
          ? data.creationDate.value
          : this.creationDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Route(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, creationDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Route &&
          other.id == this.id &&
          other.name == this.name &&
          other.creationDate == this.creationDate);
}

class RoutesCompanion extends UpdateCompanion<Route> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> creationDate;
  const RoutesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  RoutesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.creationDate = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Route> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? creationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (creationDate != null) 'creation_date': creationDate,
    });
  }

  RoutesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<DateTime>? creationDate}) {
    return RoutesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }
}

class $PointsOfInterestRoutesEntriesTable extends PointsOfInterestRoutesEntries
    with
        TableInfo<$PointsOfInterestRoutesEntriesTable,
            PointsOfInterestRoutesEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointsOfInterestRoutesEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pointOfInterestIdMeta =
      const VerificationMeta('pointOfInterestId');
  @override
  late final GeneratedColumn<int> pointOfInterestId = GeneratedColumn<int>(
      'point_of_interest_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES points_of_interests (id)'));
  static const VerificationMeta _routeIdMeta =
      const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
      'route_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES routes (id)'));
  @override
  List<GeneratedColumn> get $columns => [pointOfInterestId, routeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'points_of_interest_routes_entries';
  @override
  VerificationContext validateIntegrity(
      Insertable<PointsOfInterestRoutesEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('point_of_interest_id')) {
      context.handle(
          _pointOfInterestIdMeta,
          pointOfInterestId.isAcceptableOrUnknown(
              data['point_of_interest_id']!, _pointOfInterestIdMeta));
    } else if (isInserting) {
      context.missing(_pointOfInterestIdMeta);
    }
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PointsOfInterestRoutesEntry map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PointsOfInterestRoutesEntry(
      pointOfInterestId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}point_of_interest_id'])!,
      routeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}route_id'])!,
    );
  }

  @override
  $PointsOfInterestRoutesEntriesTable createAlias(String alias) {
    return $PointsOfInterestRoutesEntriesTable(attachedDatabase, alias);
  }
}

class PointsOfInterestRoutesEntry extends DataClass
    implements Insertable<PointsOfInterestRoutesEntry> {
  final int pointOfInterestId;
  final int routeId;
  const PointsOfInterestRoutesEntry(
      {required this.pointOfInterestId, required this.routeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['point_of_interest_id'] = Variable<int>(pointOfInterestId);
    map['route_id'] = Variable<int>(routeId);
    return map;
  }

  PointsOfInterestRoutesEntriesCompanion toCompanion(bool nullToAbsent) {
    return PointsOfInterestRoutesEntriesCompanion(
      pointOfInterestId: Value(pointOfInterestId),
      routeId: Value(routeId),
    );
  }

  factory PointsOfInterestRoutesEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointsOfInterestRoutesEntry(
      pointOfInterestId: serializer.fromJson<int>(json['pointOfInterestId']),
      routeId: serializer.fromJson<int>(json['routeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pointOfInterestId': serializer.toJson<int>(pointOfInterestId),
      'routeId': serializer.toJson<int>(routeId),
    };
  }

  PointsOfInterestRoutesEntry copyWith(
          {int? pointOfInterestId, int? routeId}) =>
      PointsOfInterestRoutesEntry(
        pointOfInterestId: pointOfInterestId ?? this.pointOfInterestId,
        routeId: routeId ?? this.routeId,
      );
  PointsOfInterestRoutesEntry copyWithCompanion(
      PointsOfInterestRoutesEntriesCompanion data) {
    return PointsOfInterestRoutesEntry(
      pointOfInterestId: data.pointOfInterestId.present
          ? data.pointOfInterestId.value
          : this.pointOfInterestId,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PointsOfInterestRoutesEntry(')
          ..write('pointOfInterestId: $pointOfInterestId, ')
          ..write('routeId: $routeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pointOfInterestId, routeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointsOfInterestRoutesEntry &&
          other.pointOfInterestId == this.pointOfInterestId &&
          other.routeId == this.routeId);
}

class PointsOfInterestRoutesEntriesCompanion
    extends UpdateCompanion<PointsOfInterestRoutesEntry> {
  final Value<int> pointOfInterestId;
  final Value<int> routeId;
  final Value<int> rowid;
  const PointsOfInterestRoutesEntriesCompanion({
    this.pointOfInterestId = const Value.absent(),
    this.routeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PointsOfInterestRoutesEntriesCompanion.insert({
    required int pointOfInterestId,
    required int routeId,
    this.rowid = const Value.absent(),
  })  : pointOfInterestId = Value(pointOfInterestId),
        routeId = Value(routeId);
  static Insertable<PointsOfInterestRoutesEntry> custom({
    Expression<int>? pointOfInterestId,
    Expression<int>? routeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pointOfInterestId != null) 'point_of_interest_id': pointOfInterestId,
      if (routeId != null) 'route_id': routeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PointsOfInterestRoutesEntriesCompanion copyWith(
      {Value<int>? pointOfInterestId, Value<int>? routeId, Value<int>? rowid}) {
    return PointsOfInterestRoutesEntriesCompanion(
      pointOfInterestId: pointOfInterestId ?? this.pointOfInterestId,
      routeId: routeId ?? this.routeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pointOfInterestId.present) {
      map['point_of_interest_id'] = Variable<int>(pointOfInterestId.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointsOfInterestRoutesEntriesCompanion(')
          ..write('pointOfInterestId: $pointOfInterestId, ')
          ..write('routeId: $routeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  const User({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  User copyWith({int? id}) => User(
        id: id ?? this.id,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is User && other.id == this.id);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  const UsersCompanion({
    this.id = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  UsersCompanion copyWith({Value<int>? id}) {
    return UsersCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
      'creation_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _routeIdMeta =
      const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
      'route_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES routes (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, creationDate, routeId, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(Insertable<Trip> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    }
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trip(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      creationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}creation_date'])!,
      routeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}route_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final int id;
  final String name;
  final DateTime creationDate;
  final int routeId;
  final int userId;
  const Trip(
      {required this.id,
      required this.name,
      required this.creationDate,
      required this.routeId,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['creation_date'] = Variable<DateTime>(creationDate);
    map['route_id'] = Variable<int>(routeId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      id: Value(id),
      name: Value(name),
      creationDate: Value(creationDate),
      routeId: Value(routeId),
      userId: Value(userId),
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      routeId: serializer.fromJson<int>(json['routeId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'routeId': serializer.toJson<int>(routeId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Trip copyWith(
          {int? id,
          String? name,
          DateTime? creationDate,
          int? routeId,
          int? userId}) =>
      Trip(
        id: id ?? this.id,
        name: name ?? this.name,
        creationDate: creationDate ?? this.creationDate,
        routeId: routeId ?? this.routeId,
        userId: userId ?? this.userId,
      );
  Trip copyWithCompanion(TripsCompanion data) {
    return Trip(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      creationDate: data.creationDate.present
          ? data.creationDate.value
          : this.creationDate,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('creationDate: $creationDate, ')
          ..write('routeId: $routeId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, creationDate, routeId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.id == this.id &&
          other.name == this.name &&
          other.creationDate == this.creationDate &&
          other.routeId == this.routeId &&
          other.userId == this.userId);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> creationDate;
  final Value<int> routeId;
  final Value<int> userId;
  const TripsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.routeId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  TripsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.creationDate = const Value.absent(),
    required int routeId,
    required int userId,
  })  : name = Value(name),
        routeId = Value(routeId),
        userId = Value(userId);
  static Insertable<Trip> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? creationDate,
    Expression<int>? routeId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (creationDate != null) 'creation_date': creationDate,
      if (routeId != null) 'route_id': routeId,
      if (userId != null) 'user_id': userId,
    });
  }

  TripsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? creationDate,
      Value<int>? routeId,
      Value<int>? userId}) {
    return TripsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      creationDate: creationDate ?? this.creationDate,
      routeId: routeId ?? this.routeId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('creationDate: $creationDate, ')
          ..write('routeId: $routeId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $TodoCategoryTable extends TodoCategory
    with TableInfo<$TodoCategoryTable, TodoCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_category';
  @override
  VerificationContext validateIntegrity(Insertable<TodoCategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoCategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $TodoCategoryTable createAlias(String alias) {
    return $TodoCategoryTable(attachedDatabase, alias);
  }
}

class TodoCategoryData extends DataClass
    implements Insertable<TodoCategoryData> {
  final int id;
  final String description;
  const TodoCategoryData({required this.id, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    return map;
  }

  TodoCategoryCompanion toCompanion(bool nullToAbsent) {
    return TodoCategoryCompanion(
      id: Value(id),
      description: Value(description),
    );
  }

  factory TodoCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoCategoryData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  TodoCategoryData copyWith({int? id, String? description}) => TodoCategoryData(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  TodoCategoryData copyWithCompanion(TodoCategoryCompanion data) {
    return TodoCategoryData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoCategoryData(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoCategoryData &&
          other.id == this.id &&
          other.description == this.description);
}

class TodoCategoryCompanion extends UpdateCompanion<TodoCategoryData> {
  final Value<int> id;
  final Value<String> description;
  const TodoCategoryCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  TodoCategoryCompanion.insert({
    this.id = const Value.absent(),
    required String description,
  }) : description = Value(description);
  static Insertable<TodoCategoryData> custom({
    Expression<int>? id,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
    });
  }

  TodoCategoryCompanion copyWith({Value<int>? id, Value<String>? description}) {
    return TodoCategoryCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoCategoryCompanion(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todo_category (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, category, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  VerificationContext validateIntegrity(Insertable<TodoItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String title;
  final String content;
  final int? category;
  final DateTime? createdAt;
  const TodoItem(
      {required this.id,
      required this.title,
      required this.content,
      this.category,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TodoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<int?>(json['category']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<int?>(category),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  TodoItem copyWith(
          {int? id,
          String? title,
          String? content,
          Value<int?> category = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent()}) =>
      TodoItem(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        category: category.present ? category.value : this.category,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  TodoItem copyWithCompanion(TodoItemsCompanion data) {
    return TodoItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      category: data.category.present ? data.category.value : this.category,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, category, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category &&
          other.createdAt == this.createdAt);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int?> category;
  final Value<DateTime?> createdAt;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  static Insertable<TodoItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? category,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodoItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<int?>? category,
      Value<DateTime?>? createdAt}) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PointsOfInterestsTable pointsOfInterests =
      $PointsOfInterestsTable(this);
  late final $RoutesTable routes = $RoutesTable(this);
  late final $PointsOfInterestRoutesEntriesTable pointsOfInterestRoutesEntries =
      $PointsOfInterestRoutesEntriesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $TripsTable trips = $TripsTable(this);
  late final $TodoCategoryTable todoCategory = $TodoCategoryTable(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        pointsOfInterests,
        routes,
        pointsOfInterestRoutesEntries,
        users,
        trips,
        todoCategory,
        todoItems
      ];
}

typedef $$PointsOfInterestsTableCreateCompanionBuilder
    = PointsOfInterestsCompanion Function({
  Value<int> id,
  required String name,
  required double latitude,
  required double longitude,
});
typedef $$PointsOfInterestsTableUpdateCompanionBuilder
    = PointsOfInterestsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> latitude,
  Value<double> longitude,
});

final class $$PointsOfInterestsTableReferences extends BaseReferences<
    _$AppDatabase, $PointsOfInterestsTable, PointsOfInterest> {
  $$PointsOfInterestsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PointsOfInterestRoutesEntriesTable,
          List<PointsOfInterestRoutesEntry>>
      _pointsOfInterestRoutesEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pointsOfInterestRoutesEntries,
              aliasName: $_aliasNameGenerator(db.pointsOfInterests.id,
                  db.pointsOfInterestRoutesEntries.pointOfInterestId));

  $$PointsOfInterestRoutesEntriesTableProcessedTableManager
      get pointsOfInterestRoutesEntriesRefs {
    final manager = $$PointsOfInterestRoutesEntriesTableTableManager(
            $_db, $_db.pointsOfInterestRoutesEntries)
        .filter((f) => f.pointOfInterestId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_pointsOfInterestRoutesEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PointsOfInterestsTableFilterComposer
    extends Composer<_$AppDatabase, $PointsOfInterestsTable> {
  $$PointsOfInterestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  Expression<bool> pointsOfInterestRoutesEntriesRefs(
      Expression<bool> Function(
              $$PointsOfInterestRoutesEntriesTableFilterComposer f)
          f) {
    final $$PointsOfInterestRoutesEntriesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.pointsOfInterestRoutesEntries,
            getReferencedColumn: (t) => t.pointOfInterestId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PointsOfInterestRoutesEntriesTableFilterComposer(
                  $db: $db,
                  $table: $db.pointsOfInterestRoutesEntries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PointsOfInterestsTableOrderingComposer
    extends Composer<_$AppDatabase, $PointsOfInterestsTable> {
  $$PointsOfInterestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));
}

class $$PointsOfInterestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PointsOfInterestsTable> {
  $$PointsOfInterestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  Expression<T> pointsOfInterestRoutesEntriesRefs<T extends Object>(
      Expression<T> Function(
              $$PointsOfInterestRoutesEntriesTableAnnotationComposer a)
          f) {
    final $$PointsOfInterestRoutesEntriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.pointsOfInterestRoutesEntries,
            getReferencedColumn: (t) => t.pointOfInterestId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PointsOfInterestRoutesEntriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.pointsOfInterestRoutesEntries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PointsOfInterestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PointsOfInterestsTable,
    PointsOfInterest,
    $$PointsOfInterestsTableFilterComposer,
    $$PointsOfInterestsTableOrderingComposer,
    $$PointsOfInterestsTableAnnotationComposer,
    $$PointsOfInterestsTableCreateCompanionBuilder,
    $$PointsOfInterestsTableUpdateCompanionBuilder,
    (PointsOfInterest, $$PointsOfInterestsTableReferences),
    PointsOfInterest,
    PrefetchHooks Function({bool pointsOfInterestRoutesEntriesRefs})> {
  $$PointsOfInterestsTableTableManager(
      _$AppDatabase db, $PointsOfInterestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PointsOfInterestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PointsOfInterestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PointsOfInterestsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
          }) =>
              PointsOfInterestsCompanion(
            id: id,
            name: name,
            latitude: latitude,
            longitude: longitude,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required double latitude,
            required double longitude,
          }) =>
              PointsOfInterestsCompanion.insert(
            id: id,
            name: name,
            latitude: latitude,
            longitude: longitude,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PointsOfInterestsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pointsOfInterestRoutesEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pointsOfInterestRoutesEntriesRefs)
                  db.pointsOfInterestRoutesEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pointsOfInterestRoutesEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PointsOfInterestsTableReferences
                            ._pointsOfInterestRoutesEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PointsOfInterestsTableReferences(db, table, p0)
                                .pointsOfInterestRoutesEntriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.pointOfInterestId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PointsOfInterestsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PointsOfInterestsTable,
    PointsOfInterest,
    $$PointsOfInterestsTableFilterComposer,
    $$PointsOfInterestsTableOrderingComposer,
    $$PointsOfInterestsTableAnnotationComposer,
    $$PointsOfInterestsTableCreateCompanionBuilder,
    $$PointsOfInterestsTableUpdateCompanionBuilder,
    (PointsOfInterest, $$PointsOfInterestsTableReferences),
    PointsOfInterest,
    PrefetchHooks Function({bool pointsOfInterestRoutesEntriesRefs})>;
typedef $$RoutesTableCreateCompanionBuilder = RoutesCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> creationDate,
});
typedef $$RoutesTableUpdateCompanionBuilder = RoutesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> creationDate,
});

final class $$RoutesTableReferences
    extends BaseReferences<_$AppDatabase, $RoutesTable, Route> {
  $$RoutesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PointsOfInterestRoutesEntriesTable,
          List<PointsOfInterestRoutesEntry>>
      _pointsOfInterestRoutesEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pointsOfInterestRoutesEntries,
              aliasName: $_aliasNameGenerator(
                  db.routes.id, db.pointsOfInterestRoutesEntries.routeId));

  $$PointsOfInterestRoutesEntriesTableProcessedTableManager
      get pointsOfInterestRoutesEntriesRefs {
    final manager = $$PointsOfInterestRoutesEntriesTableTableManager(
            $_db, $_db.pointsOfInterestRoutesEntries)
        .filter((f) => f.routeId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_pointsOfInterestRoutesEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TripsTable, List<Trip>> _tripsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.trips,
          aliasName: $_aliasNameGenerator(db.routes.id, db.trips.routeId));

  $$TripsTableProcessedTableManager get tripsRefs {
    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.routeId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_tripsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RoutesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate, builder: (column) => ColumnFilters(column));

  Expression<bool> pointsOfInterestRoutesEntriesRefs(
      Expression<bool> Function(
              $$PointsOfInterestRoutesEntriesTableFilterComposer f)
          f) {
    final $$PointsOfInterestRoutesEntriesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.pointsOfInterestRoutesEntries,
            getReferencedColumn: (t) => t.routeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PointsOfInterestRoutesEntriesTableFilterComposer(
                  $db: $db,
                  $table: $db.pointsOfInterestRoutesEntries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> tripsRefs(
      Expression<bool> Function($$TripsTableFilterComposer f) f) {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.routeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoutesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate,
      builder: (column) => ColumnOrderings(column));
}

class $$RoutesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate, builder: (column) => column);

  Expression<T> pointsOfInterestRoutesEntriesRefs<T extends Object>(
      Expression<T> Function(
              $$PointsOfInterestRoutesEntriesTableAnnotationComposer a)
          f) {
    final $$PointsOfInterestRoutesEntriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.pointsOfInterestRoutesEntries,
            getReferencedColumn: (t) => t.routeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PointsOfInterestRoutesEntriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.pointsOfInterestRoutesEntries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tripsRefs<T extends Object>(
      Expression<T> Function($$TripsTableAnnotationComposer a) f) {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.routeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoutesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutesTable,
    Route,
    $$RoutesTableFilterComposer,
    $$RoutesTableOrderingComposer,
    $$RoutesTableAnnotationComposer,
    $$RoutesTableCreateCompanionBuilder,
    $$RoutesTableUpdateCompanionBuilder,
    (Route, $$RoutesTableReferences),
    Route,
    PrefetchHooks Function(
        {bool pointsOfInterestRoutesEntriesRefs, bool tripsRefs})> {
  $$RoutesTableTableManager(_$AppDatabase db, $RoutesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> creationDate = const Value.absent(),
          }) =>
              RoutesCompanion(
            id: id,
            name: name,
            creationDate: creationDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> creationDate = const Value.absent(),
          }) =>
              RoutesCompanion.insert(
            id: id,
            name: name,
            creationDate: creationDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RoutesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {pointsOfInterestRoutesEntriesRefs = false, tripsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pointsOfInterestRoutesEntriesRefs)
                  db.pointsOfInterestRoutesEntries,
                if (tripsRefs) db.trips
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pointsOfInterestRoutesEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RoutesTableReferences
                            ._pointsOfInterestRoutesEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoutesTableReferences(db, table, p0)
                                .pointsOfInterestRoutesEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.routeId == item.id),
                        typedResults: items),
                  if (tripsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RoutesTableReferences._tripsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoutesTableReferences(db, table, p0).tripsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.routeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RoutesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoutesTable,
    Route,
    $$RoutesTableFilterComposer,
    $$RoutesTableOrderingComposer,
    $$RoutesTableAnnotationComposer,
    $$RoutesTableCreateCompanionBuilder,
    $$RoutesTableUpdateCompanionBuilder,
    (Route, $$RoutesTableReferences),
    Route,
    PrefetchHooks Function(
        {bool pointsOfInterestRoutesEntriesRefs, bool tripsRefs})>;
typedef $$PointsOfInterestRoutesEntriesTableCreateCompanionBuilder
    = PointsOfInterestRoutesEntriesCompanion Function({
  required int pointOfInterestId,
  required int routeId,
  Value<int> rowid,
});
typedef $$PointsOfInterestRoutesEntriesTableUpdateCompanionBuilder
    = PointsOfInterestRoutesEntriesCompanion Function({
  Value<int> pointOfInterestId,
  Value<int> routeId,
  Value<int> rowid,
});

final class $$PointsOfInterestRoutesEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $PointsOfInterestRoutesEntriesTable,
        PointsOfInterestRoutesEntry> {
  $$PointsOfInterestRoutesEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PointsOfInterestsTable _pointOfInterestIdTable(_$AppDatabase db) =>
      db.pointsOfInterests.createAlias($_aliasNameGenerator(
          db.pointsOfInterestRoutesEntries.pointOfInterestId,
          db.pointsOfInterests.id));

  $$PointsOfInterestsTableProcessedTableManager? get pointOfInterestId {
    if ($_item.pointOfInterestId == null) return null;
    final manager =
        $$PointsOfInterestsTableTableManager($_db, $_db.pointsOfInterests)
            .filter((f) => f.id($_item.pointOfInterestId!));
    final item = $_typedResult.readTableOrNull(_pointOfInterestIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RoutesTable _routeIdTable(_$AppDatabase db) =>
      db.routes.createAlias($_aliasNameGenerator(
          db.pointsOfInterestRoutesEntries.routeId, db.routes.id));

  $$RoutesTableProcessedTableManager? get routeId {
    if ($_item.routeId == null) return null;
    final manager = $$RoutesTableTableManager($_db, $_db.routes)
        .filter((f) => f.id($_item.routeId!));
    final item = $_typedResult.readTableOrNull(_routeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PointsOfInterestRoutesEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PointsOfInterestRoutesEntriesTable> {
  $$PointsOfInterestRoutesEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PointsOfInterestsTableFilterComposer get pointOfInterestId {
    final $$PointsOfInterestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pointOfInterestId,
        referencedTable: $db.pointsOfInterests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PointsOfInterestsTableFilterComposer(
              $db: $db,
              $table: $db.pointsOfInterests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RoutesTableFilterComposer get routeId {
    final $$RoutesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableFilterComposer(
              $db: $db,
              $table: $db.routes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PointsOfInterestRoutesEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PointsOfInterestRoutesEntriesTable> {
  $$PointsOfInterestRoutesEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PointsOfInterestsTableOrderingComposer get pointOfInterestId {
    final $$PointsOfInterestsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pointOfInterestId,
        referencedTable: $db.pointsOfInterests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PointsOfInterestsTableOrderingComposer(
              $db: $db,
              $table: $db.pointsOfInterests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RoutesTableOrderingComposer get routeId {
    final $$RoutesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableOrderingComposer(
              $db: $db,
              $table: $db.routes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PointsOfInterestRoutesEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PointsOfInterestRoutesEntriesTable> {
  $$PointsOfInterestRoutesEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PointsOfInterestsTableAnnotationComposer get pointOfInterestId {
    final $$PointsOfInterestsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.pointOfInterestId,
            referencedTable: $db.pointsOfInterests,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PointsOfInterestsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.pointsOfInterests,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$RoutesTableAnnotationComposer get routeId {
    final $$RoutesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableAnnotationComposer(
              $db: $db,
              $table: $db.routes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PointsOfInterestRoutesEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PointsOfInterestRoutesEntriesTable,
    PointsOfInterestRoutesEntry,
    $$PointsOfInterestRoutesEntriesTableFilterComposer,
    $$PointsOfInterestRoutesEntriesTableOrderingComposer,
    $$PointsOfInterestRoutesEntriesTableAnnotationComposer,
    $$PointsOfInterestRoutesEntriesTableCreateCompanionBuilder,
    $$PointsOfInterestRoutesEntriesTableUpdateCompanionBuilder,
    (
      PointsOfInterestRoutesEntry,
      $$PointsOfInterestRoutesEntriesTableReferences
    ),
    PointsOfInterestRoutesEntry,
    PrefetchHooks Function({bool pointOfInterestId, bool routeId})> {
  $$PointsOfInterestRoutesEntriesTableTableManager(
      _$AppDatabase db, $PointsOfInterestRoutesEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PointsOfInterestRoutesEntriesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$PointsOfInterestRoutesEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PointsOfInterestRoutesEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pointOfInterestId = const Value.absent(),
            Value<int> routeId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PointsOfInterestRoutesEntriesCompanion(
            pointOfInterestId: pointOfInterestId,
            routeId: routeId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int pointOfInterestId,
            required int routeId,
            Value<int> rowid = const Value.absent(),
          }) =>
              PointsOfInterestRoutesEntriesCompanion.insert(
            pointOfInterestId: pointOfInterestId,
            routeId: routeId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PointsOfInterestRoutesEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {pointOfInterestId = false, routeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pointOfInterestId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pointOfInterestId,
                    referencedTable:
                        $$PointsOfInterestRoutesEntriesTableReferences
                            ._pointOfInterestIdTable(db),
                    referencedColumn:
                        $$PointsOfInterestRoutesEntriesTableReferences
                            ._pointOfInterestIdTable(db)
                            .id,
                  ) as T;
                }
                if (routeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.routeId,
                    referencedTable:
                        $$PointsOfInterestRoutesEntriesTableReferences
                            ._routeIdTable(db),
                    referencedColumn:
                        $$PointsOfInterestRoutesEntriesTableReferences
                            ._routeIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PointsOfInterestRoutesEntriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PointsOfInterestRoutesEntriesTable,
        PointsOfInterestRoutesEntry,
        $$PointsOfInterestRoutesEntriesTableFilterComposer,
        $$PointsOfInterestRoutesEntriesTableOrderingComposer,
        $$PointsOfInterestRoutesEntriesTableAnnotationComposer,
        $$PointsOfInterestRoutesEntriesTableCreateCompanionBuilder,
        $$PointsOfInterestRoutesEntriesTableUpdateCompanionBuilder,
        (
          PointsOfInterestRoutesEntry,
          $$PointsOfInterestRoutesEntriesTableReferences
        ),
        PointsOfInterestRoutesEntry,
        PrefetchHooks Function({bool pointOfInterestId, bool routeId})>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TripsTable, List<Trip>> _tripsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.trips,
          aliasName: $_aliasNameGenerator(db.users.id, db.trips.userId));

  $$TripsTableProcessedTableManager get tripsRefs {
    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_tripsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  Expression<bool> tripsRefs(
      Expression<bool> Function($$TripsTableFilterComposer f) f) {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  Expression<T> tripsRefs<T extends Object>(
      Expression<T> Function($$TripsTableAnnotationComposer a) f) {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool tripsRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({tripsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tripsRefs) db.trips],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tripsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._tripsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).tripsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool tripsRefs})>;
typedef $$TripsTableCreateCompanionBuilder = TripsCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> creationDate,
  required int routeId,
  required int userId,
});
typedef $$TripsTableUpdateCompanionBuilder = TripsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> creationDate,
  Value<int> routeId,
  Value<int> userId,
});

final class $$TripsTableReferences
    extends BaseReferences<_$AppDatabase, $TripsTable, Trip> {
  $$TripsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoutesTable _routeIdTable(_$AppDatabase db) => db.routes
      .createAlias($_aliasNameGenerator(db.trips.routeId, db.routes.id));

  $$RoutesTableProcessedTableManager? get routeId {
    if ($_item.routeId == null) return null;
    final manager = $$RoutesTableTableManager($_db, $_db.routes)
        .filter((f) => f.id($_item.routeId!));
    final item = $_typedResult.readTableOrNull(_routeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.trips.userId, db.users.id));

  $$UsersTableProcessedTableManager? get userId {
    if ($_item.userId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId!));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TripsTableFilterComposer extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate, builder: (column) => ColumnFilters(column));

  $$RoutesTableFilterComposer get routeId {
    final $$RoutesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableFilterComposer(
              $db: $db,
              $table: $db.routes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TripsTableOrderingComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate,
      builder: (column) => ColumnOrderings(column));

  $$RoutesTableOrderingComposer get routeId {
    final $$RoutesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableOrderingComposer(
              $db: $db,
              $table: $db.routes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TripsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get creationDate => $composableBuilder(
      column: $table.creationDate, builder: (column) => column);

  $$RoutesTableAnnotationComposer get routeId {
    final $$RoutesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableAnnotationComposer(
              $db: $db,
              $table: $db.routes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TripsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableAnnotationComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, $$TripsTableReferences),
    Trip,
    PrefetchHooks Function({bool routeId, bool userId})> {
  $$TripsTableTableManager(_$AppDatabase db, $TripsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> creationDate = const Value.absent(),
            Value<int> routeId = const Value.absent(),
            Value<int> userId = const Value.absent(),
          }) =>
              TripsCompanion(
            id: id,
            name: name,
            creationDate: creationDate,
            routeId: routeId,
            userId: userId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> creationDate = const Value.absent(),
            required int routeId,
            required int userId,
          }) =>
              TripsCompanion.insert(
            id: id,
            name: name,
            creationDate: creationDate,
            routeId: routeId,
            userId: userId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TripsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({routeId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (routeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.routeId,
                    referencedTable: $$TripsTableReferences._routeIdTable(db),
                    referencedColumn:
                        $$TripsTableReferences._routeIdTable(db).id,
                  ) as T;
                }
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $$TripsTableReferences._userIdTable(db),
                    referencedColumn:
                        $$TripsTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TripsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableAnnotationComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, $$TripsTableReferences),
    Trip,
    PrefetchHooks Function({bool routeId, bool userId})>;
typedef $$TodoCategoryTableCreateCompanionBuilder = TodoCategoryCompanion
    Function({
  Value<int> id,
  required String description,
});
typedef $$TodoCategoryTableUpdateCompanionBuilder = TodoCategoryCompanion
    Function({
  Value<int> id,
  Value<String> description,
});

final class $$TodoCategoryTableReferences extends BaseReferences<_$AppDatabase,
    $TodoCategoryTable, TodoCategoryData> {
  $$TodoCategoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TodoItemsTable, List<TodoItem>>
      _todoItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.todoItems,
          aliasName:
              $_aliasNameGenerator(db.todoCategory.id, db.todoItems.category));

  $$TodoItemsTableProcessedTableManager get todoItemsRefs {
    final manager = $$TodoItemsTableTableManager($_db, $_db.todoItems)
        .filter((f) => f.category.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_todoItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TodoCategoryTableFilterComposer
    extends Composer<_$AppDatabase, $TodoCategoryTable> {
  $$TodoCategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  Expression<bool> todoItemsRefs(
      Expression<bool> Function($$TodoItemsTableFilterComposer f) f) {
    final $$TodoItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.todoItems,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoItemsTableFilterComposer(
              $db: $db,
              $table: $db.todoItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TodoCategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoCategoryTable> {
  $$TodoCategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$TodoCategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoCategoryTable> {
  $$TodoCategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  Expression<T> todoItemsRefs<T extends Object>(
      Expression<T> Function($$TodoItemsTableAnnotationComposer a) f) {
    final $$TodoItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.todoItems,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.todoItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TodoCategoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoCategoryTable,
    TodoCategoryData,
    $$TodoCategoryTableFilterComposer,
    $$TodoCategoryTableOrderingComposer,
    $$TodoCategoryTableAnnotationComposer,
    $$TodoCategoryTableCreateCompanionBuilder,
    $$TodoCategoryTableUpdateCompanionBuilder,
    (TodoCategoryData, $$TodoCategoryTableReferences),
    TodoCategoryData,
    PrefetchHooks Function({bool todoItemsRefs})> {
  $$TodoCategoryTableTableManager(_$AppDatabase db, $TodoCategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoCategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoCategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoCategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              TodoCategoryCompanion(
            id: id,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
          }) =>
              TodoCategoryCompanion.insert(
            id: id,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TodoCategoryTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({todoItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (todoItemsRefs) db.todoItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (todoItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TodoCategoryTableReferences
                            ._todoItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TodoCategoryTableReferences(db, table, p0)
                                .todoItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.category == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TodoCategoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TodoCategoryTable,
    TodoCategoryData,
    $$TodoCategoryTableFilterComposer,
    $$TodoCategoryTableOrderingComposer,
    $$TodoCategoryTableAnnotationComposer,
    $$TodoCategoryTableCreateCompanionBuilder,
    $$TodoCategoryTableUpdateCompanionBuilder,
    (TodoCategoryData, $$TodoCategoryTableReferences),
    TodoCategoryData,
    PrefetchHooks Function({bool todoItemsRefs})>;
typedef $$TodoItemsTableCreateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  required String title,
  required String content,
  Value<int?> category,
  Value<DateTime?> createdAt,
});
typedef $$TodoItemsTableUpdateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
  Value<int?> category,
  Value<DateTime?> createdAt,
});

final class $$TodoItemsTableReferences
    extends BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem> {
  $$TodoItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TodoCategoryTable _categoryTable(_$AppDatabase db) =>
      db.todoCategory.createAlias(
          $_aliasNameGenerator(db.todoItems.category, db.todoCategory.id));

  $$TodoCategoryTableProcessedTableManager? get category {
    if ($_item.category == null) return null;
    final manager = $$TodoCategoryTableTableManager($_db, $_db.todoCategory)
        .filter((f) => f.id($_item.category!));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TodoItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$TodoCategoryTableFilterComposer get category {
    final $$TodoCategoryTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.todoCategory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoCategoryTableFilterComposer(
              $db: $db,
              $table: $db.todoCategory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$TodoCategoryTableOrderingComposer get category {
    final $$TodoCategoryTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.todoCategory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoCategoryTableOrderingComposer(
              $db: $db,
              $table: $db.todoCategory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TodoCategoryTableAnnotationComposer get category {
    final $$TodoCategoryTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.todoCategory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoCategoryTableAnnotationComposer(
              $db: $db,
              $table: $db.todoCategory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableAnnotationComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder,
    (TodoItem, $$TodoItemsTableReferences),
    TodoItem,
    PrefetchHooks Function({bool category})> {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<int?> category = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TodoItemsCompanion(
            id: id,
            title: title,
            content: content,
            category: category,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
            Value<int?> category = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TodoItemsCompanion.insert(
            id: id,
            title: title,
            content: content,
            category: category,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TodoItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({category = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (category) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.category,
                    referencedTable:
                        $$TodoItemsTableReferences._categoryTable(db),
                    referencedColumn:
                        $$TodoItemsTableReferences._categoryTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TodoItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableAnnotationComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder,
    (TodoItem, $$TodoItemsTableReferences),
    TodoItem,
    PrefetchHooks Function({bool category})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PointsOfInterestsTableTableManager get pointsOfInterests =>
      $$PointsOfInterestsTableTableManager(_db, _db.pointsOfInterests);
  $$RoutesTableTableManager get routes =>
      $$RoutesTableTableManager(_db, _db.routes);
  $$PointsOfInterestRoutesEntriesTableTableManager
      get pointsOfInterestRoutesEntries =>
          $$PointsOfInterestRoutesEntriesTableTableManager(
              _db, _db.pointsOfInterestRoutesEntries);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db, _db.trips);
  $$TodoCategoryTableTableManager get todoCategory =>
      $$TodoCategoryTableTableManager(_db, _db.todoCategory);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
}
