import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_dji_fly/theme.dart';
import 'package:test_dji_fly/views/controll_view.dart';

void main() {  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const ControllView(),
    );
  }
}