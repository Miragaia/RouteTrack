import 'dart:collection';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:routertrack/repository/route_repository.dart';

@immutable
sealed class RouteState extends Equatable {
  const RouteState(this.routeItemEntries);
  final LinkedList<RouteItemEntry> routeItemEntries;

  @override
  List<Object> get props => [routeItemEntries.iterator];
}

final class RouteStateCreated extends RouteState {
  const RouteStateCreated(super.pointsOfInterestLinkedList, this.lastAddedEntry);
  final RouteItemEntry lastAddedEntry;

  @override
  List<Object> get props => [routeItemEntries.iterator, lastAddedEntry];
}

final class RouteStateRepeated extends RouteState {
  const RouteStateRepeated(super.pointsOfInterestLinkedList, this.repeatedEntry);
  final RouteItemEntry repeatedEntry;
}

final class RouteStateCleared extends RouteState {
  const RouteStateCleared(super.pointsOfInterestLinkedList);
}

final class RouteStatePersisted extends RouteState {
  const RouteStatePersisted(super.pointsOfInterestLinkedList);
}
