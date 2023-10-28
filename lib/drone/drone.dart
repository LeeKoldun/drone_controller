import 'dart:io';

import 'package:udp/udp.dart';

class DjiDrone {  
  bool _isFlying = false;
  bool get isFlying => _isFlying;

  final UDP sender;
  final Stream reciever;

  final String droneIp;
  final int dronePort;

  Future<bool> isConnected() async {
    try {
      await InternetAddress.lookup("$droneIp:$dronePort");
      return true;
    }
    catch (e) {
      return false;
    }
  }

  static Future<DjiDrone> init({
    required String droneIp,
    required int port,
  }) async {
    var sender = await UDP.bind(Endpoint.any(port: const Port(9000)));

    return DjiDrone._(
      sender: sender,
      reciever: sender.asStream(),
      droneIp: droneIp,
      dronePort: port
    );
  }

  void dispose() {
    sender.close();
  }

  void sendData(String data) {    
    sender.send(
        data.codeUnits,
        Endpoint.unicast(InternetAddress.tryParse(droneIp),
            port: Port(dronePort)));
  }

  // CONTROLS //

  void start() async {
    sendData("command");
    await Future.delayed(const Duration(seconds: 1));
    sendData("battery?");
    sendData("takeoff");
    _isFlying = true;
  }

  void stop() {
    sendData("land");
    _isFlying = false;
  }

  void setRc(double a, double b, double c, double d) => sendData("rc $a $b $c $d");

  DjiDrone._({
    required this.sender,
    required this.reciever,
    required this.droneIp,
    required this.dronePort,
  });
}
