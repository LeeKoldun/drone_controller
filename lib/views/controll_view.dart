import 'package:flutter/material.dart';
import 'package:test_dji_fly/theme.dart';
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
    vm = ControllVm(update: () => setState(() {}));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              ElevatedButton(
                onPressed: vm.isReady.value ? vm.switchEnable : null, 
                child: vm.isReady.value ? Icon(vm.drone.isFlying ? Icons.download_rounded : Icons.upgrade_rounded) : const Text("Подключитесь к дрону")
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: vm.isConnecting.value ? null : vm.connectToDrone, 
                  child: vm.isConnecting.value ? FittedBox(child: CircularProgressIndicator(color: appTheme.colorScheme.onPrimary)) : const Text("Подключиться")
                ),
              ),
              
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(vm.isReady.value) DroneJoystick(listener: vm.leftStickControl),
                      if(vm.isReady.value) DroneJoystick(listener: vm.rightStickControl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}