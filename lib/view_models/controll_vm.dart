import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:test_dji_fly/drone/drone.dart';

class ControllVm {
  final VoidCallback update;

  ValueNotifier<bool> isReady = ValueNotifier(false);
  ValueNotifier<bool> isConnecting = ValueNotifier(false);

  bool isStarted = false;
  bool lock = false;
  String command = "";

  late DjiDrone drone;
  bool droneInited = false;

  double moveSpeed = 5;
  double rotateSpeed = 5;
  double upDownSpeed = 5;

  double upDown = 0;
  double leftRight = 0;
  double forwardBack = 0;

  double rotate = 0;

  bool _isFlying = false;

  ControllVm({
    required this.update
  }) {
    isReady.addListener(update);
    isConnecting.addListener(update);
  }

  void switchEnable() {
    if(_isFlying) {
      drone.stop();
      _isFlying = false;
      update();
    }
    else {
      drone.start();
      _isFlying = true;
      update();
    }
  }

  void connectToDrone() {
    if(droneInited) drone.dispose();

    isConnecting.value = true;

    var init = DjiDrone.init(droneIp: "192.168.10.1", port: 8889);
    init.then((data) async {
      if(!await data.isConnected()) {
        isConnecting.value = false;
        return;
      }

      drone = data;
      isReady.value = true;
      droneInited = true;
      isConnecting.value = false;
    });
  }

  void leftStickControl(StickDragDetails data) {
    upDown = data.y * upDownSpeed * -1;
    rotate = data.x * rotateSpeed;

    printData();
    drone.setRc(leftRight, forwardBack, upDown, rotate);
  }

  void rightStickControl(StickDragDetails data) {
    forwardBack = data.y * upDownSpeed * -1;
    leftRight = data.x * rotateSpeed;

    printData();
    drone.setRc(leftRight, forwardBack, upDown, rotate);
  }

  void printData() => debugPrint("\nUp/Down: $upDown\nLeft/Right: $leftRight\nForward/Back: $forwardBack\nRotate: $rotate\n");
}