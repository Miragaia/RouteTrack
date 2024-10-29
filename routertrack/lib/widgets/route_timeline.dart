import 'dart:math';

import 'package:flutter/material.dart';
import 'package:routertrack/dto/route_with_points_dto.dart';

class RouteTimeline extends StatelessWidget {

  const RouteTimeline({super.key, required this.routesWithPoints});

  final List<RouteWithPoints> routesWithPoints;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: routesWithPoints.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 7.6, horizontal: 24),
          clipBehavior: Clip.hardEdge,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 39,
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Titulo",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality to send data here
                          print("Data sent to smartphone");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Customize button color if needed
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Send Data",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Stepper(
                  physics: const NeverScrollableScrollPhysics(),
                  key: Key(Random.secure().nextDouble().toString()), // needs to be constant to be clicked
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
                  currentStep: routesWithPoints[index].pointsOfInterest.length - 1,
                  type: StepperType.vertical, // Make it vertical like a timeline
                  onStepTapped: (int index){},
                  steps: routesWithPoints[index].pointsOfInterest.indexed.map((item) {
                    final (index, entry) = item;

                    return Step(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.title,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            entry.description,
                            style: TextStyle(
                              height: 1.2,
                              color: Color.fromARGB(255, 112, 112, 112),
                              fontSize: 11.5,
                            ),
                          ),
                        ],
                      ),
                      content: const SizedBox.shrink(),
                      isActive: true,
                      state: StepState.complete,
                    );
                  }).toList(),
                  controlsBuilder: (BuildContext context, ControlsDetails controls) {
                    // Remove default buttons to mimic timeline
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}