import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:routertrack/repository/route_repository.dart';

@immutable
sealed class RouteCartState extends Equatable {
  const RouteCartState(this.pointsOfInterestLinkedList);
  final LinkedList<PointsOfInterestEntry> pointsOfInterestLinkedList;

  @override
  List<Object> get props => [pointsOfInterestLinkedList];
}

final class RouteCartCreated extends RouteCartState {
  const RouteCartCreated(super.pointsOfInterestLinkedList);
}