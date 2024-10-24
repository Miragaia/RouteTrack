import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class RouteCartState extends Equatable {
  const RouteCartState();
}

final class RouteCartCreated extends RouteCartState {
  @override
  List<Object> get props => [];
}