import 'dart:collection';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:routertrack/repository/route_repository.dart';

@immutable
sealed class RouteState extends Equatable {
  const RouteState(this.routeItemEntries);
  final LinkedList<PointsOfInterestEntry> routeItemEntries;

  @override
  List<Object> get props => [routeItemEntries];
}

final class RouteStateCreated extends RouteState {
  const RouteStateCreated(super.pointsOfInterestLinkedList);
}

final class RouteStateCleared extends RouteState {
  const RouteStateCleared(super.pointsOfInterestLinkedList);
}