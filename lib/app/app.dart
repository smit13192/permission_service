import 'package:flutter/material.dart';
import 'package:permission_service/src/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: const HomeScreen(),
    );
  }
}
