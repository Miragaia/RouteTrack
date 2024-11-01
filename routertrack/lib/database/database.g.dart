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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
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
  List<GeneratedColumn> get $columns =>
      [id, title, description, latitude, longitude];
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
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
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
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
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
  final String title;
  final String description;
  final double latitude;
  final double longitude;
  const PointsOfInterest(
      {required this.id,
      required this.title,
      required this.description,
      required this.latitude,
      required this.longitude});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    return map;
  }

  PointsOfInterestsCompanion toCompanion(bool nullToAbsent) {
    return PointsOfInterestsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      latitude: Value(latitude),
      longitude: Value(longitude),
    );
  }

  factory PointsOfInterest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointsOfInterest(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
    };
  }

  PointsOfInterest copyWith(
          {int? id,
          String? title,
          String? description,
          double? latitude,
          double? longitude}) =>
      PointsOfInterest(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
  PointsOfInterest copyWithCompanion(PointsOfInterestsCompanion data) {
    return PointsOfInterest(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PointsOfInterest(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, latitude, longitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointsOfInterest &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude);
}

class PointsOfInterestsCompanion extends UpdateCompanion<PointsOfInterest> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<double> latitude;
  final Value<double> longitude;
  const PointsOfInterestsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
  });
  PointsOfInterestsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required double latitude,
    required double longitude,
  })  : title = Value(title),
        description = Value(description),
        latitude = Value(latitude),
        longitude = Value(longitude);
  static Insertable<PointsOfInterest> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<double>? latitude,
    Expression<double>? longitude,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    });
  }

  PointsOfInterestsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<double>? latitude,
      Value<double>? longitude}) {
    return PointsOfInterestsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
          ..write('title: $title, ')
          ..write('description: $description, ')
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
  static const VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
      'creation_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, creationDate];
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
  final DateTime creationDate;
  const Route({required this.id, required this.creationDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['creation_date'] = Variable<DateTime>(creationDate);
    return map;
  }

  RoutesCompanion toCompanion(bool nullToAbsent) {
    return RoutesCompanion(
      id: Value(id),
      creationDate: Value(creationDate),
    );
  }

  factory Route.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Route(
      id: serializer.fromJson<int>(json['id']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'creationDate': serializer.toJson<DateTime>(creationDate),
    };
  }

  Route copyWith({int? id, DateTime? creationDate}) => Route(
        id: id ?? this.id,
        creationDate: creationDate ?? this.creationDate,
      );
  Route copyWithCompanion(RoutesCompanion data) {
    return Route(
      id: data.id.present ? data.id.value : this.id,
      creationDate: data.creationDate.present
          ? data.creationDate.value
          : this.creationDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Route(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, creationDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Route &&
          other.id == this.id &&
          other.creationDate == this.creationDate);
}

class RoutesCompanion extends UpdateCompanion<Route> {
  final Value<int> id;
  final Value<DateTime> creationDate;
  const RoutesCompanion({
    this.id = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  RoutesCompanion.insert({
    this.id = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  static Insertable<Route> custom({
    Expression<int>? id,
    Expression<DateTime>? creationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (creationDate != null) 'creation_date': creationDate,
    });
  }

  RoutesCompanion copyWith({Value<int>? id, Value<DateTime>? creationDate}) {
    return RoutesCompanion(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PointsOfInterestsTable pointsOfInterests =
      $PointsOfInterestsTable(this);
  late final $RoutesTable routes = $RoutesTable(this);
  late final $PointsOfInterestRoutesEntriesTable pointsOfInterestRoutesEntries =
      $PointsOfInterestRoutesEntriesTable(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [pointsOfInterests, routes, pointsOfInterestRoutesEntries, users];
}

typedef $$PointsOfInterestsTableCreateCompanionBuilder
    = PointsOfInterestsCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  required double latitude,
  required double longitude,
});
typedef $$PointsOfInterestsTableUpdateCompanionBuilder
    = PointsOfInterestsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
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

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

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
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
          }) =>
              PointsOfInterestsCompanion(
            id: id,
            title: title,
            description: description,
            latitude: latitude,
            longitude: longitude,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            required double latitude,
            required double longitude,
          }) =>
              PointsOfInterestsCompanion.insert(
            id: id,
            title: title,
            description: description,
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
  Value<DateTime> creationDate,
});
typedef $$RoutesTableUpdateCompanionBuilder = RoutesCompanion Function({
  Value<int> id,
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
    PrefetchHooks Function({bool pointsOfInterestRoutesEntriesRefs})> {
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
            Value<DateTime> creationDate = const Value.absent(),
          }) =>
              RoutesCompanion(
            id: id,
            creationDate: creationDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> creationDate = const Value.absent(),
          }) =>
              RoutesCompanion.insert(
            id: id,
            creationDate: creationDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RoutesTableReferences(db, table, e)))
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
                        referencedTable: $$RoutesTableReferences
                            ._pointsOfInterestRoutesEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoutesTableReferences(db, table, p0)
                                .pointsOfInterestRoutesEntriesRefs,
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
    PrefetchHooks Function({bool pointsOfInterestRoutesEntriesRefs})>;
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
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;

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
}
