import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:test_dji_fly/drone/drone.dart';

class ControllVm {
  bool isStarted = false;
  bool isReady = false;
  bool lock = false;
  String command = "";
  late DjiDrone drone;

  double moveSpeed = 5;
  double rotateSpeed = 5;
  double upDownSpeed = 5;

  double upDown = 0;
  double leftRight = 0;
  double forwardBack = 0;

  double rotate = 0;

  bool _isFlying = false;

  ControllVm() {
    DjiDrone.init(droneIp: "192.168.10.1", port: 8889).then((data) {
      drone = data;
      isReady = true;
    });
  }

  void switchEnable() {
    if(_isFlying) { drone.stop(); }
    else { drone.start(); }
  }

  void leftStickControl(StickDragDetails data) {
    upDown = data.y * upDownSpeed;
    rotate = data.x * rotateSpeed;

    drone.setRc(leftRight, forwardBack, upDown, rotate);
  }

  void rightStickControl(StickDragDetails data) {
    forwardBack = data.y * upDownSpeed;
    leftRight = data.x * rotateSpeed;

    drone.setRc(leftRight, forwardBack, upDown, rotate);
  }
}