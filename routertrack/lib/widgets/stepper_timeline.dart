import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routertrack/mycolors/colors.dart';

import '../bloc/route_creation/route_creation_bloc.dart';
import '../bloc/route_creation/route_creation_state.dart';


class StepperTimeline extends StatefulWidget {
  const StepperTimeline({super.key});

  @override
  State<StepperTimeline> createState() => _StepperTimelineState();
}

class _StepperTimelineState extends State<StepperTimeline> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RouteCreationBloc, RouteState>(
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(
            // splashFactory: NoSplash.splashFactory,
            // highlightColor: Colors.transparent,
          ),
          child: Stepper(
            key: Key(Random.secure().nextDouble().toString()), // needs to be constant to be clicked
            stepIconBuilder: (stepIndex, stepState) => Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: stepState == StepState.complete ? MyColorPalette.forestGreen : Colors.grey,
              ),
              child: Center(
                child: stepIndex == 0 ? const Icon(Icons.home, color: Colors.white, size: 16,) :
                stepIndex == state.routeItemEntries.length - 1 ?
                const Icon(Icons.flag, color: Colors.white, size: 16,) :
                Text(
                  stepIndex.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            currentStep: state.routeItemEntries.length - 1,
            type: StepperType.vertical, // Make it vertical like a timeline
            onStepTapped: (int index){
              setState(() {
                _index = index;
              });
            },
            steps: state.routeItemEntries.indexed.map((item) {
              final (index, entry) = item;

              return Step(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.routeItem.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: MyColorPalette.forestGreen,
                      ),
                    ),
                    Text(
                      entry.routeItem.description,
                      style: const TextStyle(
                        height: 1.2,
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontSize: 11.5,
                      ),
                    ),
                  ],
                ),
                content: Container(
                  alignment: Alignment.centerLeft,
                  child: const SizedBox.shrink(),
                ),
                isActive: true,
                state: StepState.complete,
              );
            }).toList(),
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              // Remove default buttons to mimic timeline
              return const SizedBox.shrink();
            },
          ),
        );
      }
    );
  }
}