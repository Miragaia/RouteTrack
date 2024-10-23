import 'package:flutter/material.dart';

class StepperTimeline extends StatefulWidget {
  const StepperTimeline({super.key});

  @override
  State<StepperTimeline> createState() => _StepperTimelineState();
}

class _StepperTimelineState extends State<StepperTimeline> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
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
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: Text(
            'Step 1',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _index == 0 ? Colors.green : Colors.black,
            ),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1'),
          ),
          isActive: _index == 0,
          state: _index == 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text(
            'Step 2',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _index == 1 ? Colors.green : Colors.black,
            ),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1'),
          ),
          isActive: _index == 1,
          state: _index == 1 ? StepState.complete : StepState.indexed,
        ),
      ],
      controlsBuilder: (BuildContext context, ControlsDetails controls) {
        return const SizedBox.shrink(); // Remove default buttons to mimic timeline
      },
    );
  }
}