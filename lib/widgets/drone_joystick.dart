import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class DroneJoystick extends StatelessWidget {
  final void Function(StickDragDetails) listener;

  const DroneJoystick({
    super.key,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return Joystick(listener: (data) => listener);
  }
}