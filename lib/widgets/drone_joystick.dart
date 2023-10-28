import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:test_dji_fly/theme.dart';

class DroneJoystick extends StatelessWidget {
  final void Function(StickDragDetails) listener;

  const DroneJoystick({
    super.key,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return Joystick(
      listener: (data) => listener(data),

      base: JoystickStyle(color: appTheme.colorScheme.secondary),
      stick: const StickStyle(),
    );
  }
}

class StickStyle extends StatelessWidget {
  const StickStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shape: BoxShape.circle,
      elevation: 20,
      child: Container(
        width: 80,
        height: 80,
    
        decoration: BoxDecoration(
          color: appTheme.colorScheme.primary,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}

class JoystickStyle extends StatelessWidget {
  final Color color;

  const JoystickStyle({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shape: BoxShape.circle,
      elevation: 10,

      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: color.withAlpha(100),
          border: Border.all(
            width: 5,
            color: color.withAlpha(150),
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}