import 'package:flutter/material.dart';
import 'package:test_dji_fly/view_models/controll_vm.dart';
import 'package:test_dji_fly/widgets/drone_joystick.dart';

class ControllView extends StatefulWidget {
  const ControllView({super.key});

  @override
  State<ControllView> createState() => _ControllViewState();
}

class _ControllViewState extends State<ControllView> {
  late ControllVm vm;
  @override
  void initState() {
    super.initState();
    vm = ControllVm();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ElevatedButton(
            onPressed: vm.switchEnable, 
            child: const Text("Взлёт/Приземление")
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(vm.isReady) DroneJoystick(listener: vm.leftStickControl),
                if(vm.isReady) DroneJoystick(listener: vm.rightStickControl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}