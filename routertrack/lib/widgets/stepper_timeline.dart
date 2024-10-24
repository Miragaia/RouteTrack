import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routertrack/bloc/route_cart/route_cart_bloc.dart';
import 'package:routertrack/bloc/route_cart/route_cart_events.dart';
import 'package:routertrack/bloc/route_cart/route_cart_state.dart';
import 'package:routertrack/database/database.dart';

class StepperTimeline extends StatefulWidget {
  const StepperTimeline({super.key});

  @override
  State<StepperTimeline> createState() => _StepperTimelineState();
}

class _StepperTimelineState extends State<StepperTimeline> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final RouteCartBloc _routeCartBloc = BlocProvider.of<RouteCartBloc>(context);

    return BlocBuilder<RouteCartBloc, RouteCartState>(
      builder: (context, state) {
        return Stepper(
          key: Key(Random.secure().nextDouble().toString()),
          stepIconBuilder: (stepIndex, stepState) => Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: stepState == StepState.complete ? Colors.green : Colors.grey,
            ),
            child: Center(
              child: Text(
                'cenas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          currentStep: _index,
          type: StepperType.vertical, // Make it vertical like a timeline
          onStepTapped: (int index) {
            print("added point of interest");

          },
          steps: state.pointsOfInterestLinkedList.indexed.map((item) {
            final (index, entry) = item;
            return Step(
              title: Text(
                entry.pointsOfInterest.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _index == index ? Colors.green : Colors.black,
                ),
              ),
              content: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 1'),
              ),
              isActive: _index == index,
              state: _index == index ? StepState.complete : StepState.indexed,
            );
          }).toList(),
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return const SizedBox.shrink(); // Remove default buttons to mimic timeline
          },
        );
      }
    );
  }
}