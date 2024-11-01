import 'package:flutter/material.dart';

class DirectionStatusBar extends StatelessWidget {
  final String directionStatus;

  const DirectionStatusBar({required this.directionStatus, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: directionStatus == 'Correct Direction' ? Colors.green : Colors.red,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          directionStatus,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
