import 'package:flutter/material.dart';
import 'package:scanner_app/first_page.dart';

void main() {
  runApp(const ScannerApp());
}

class ScannerApp extends StatelessWidget {
  const ScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner App',
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    );
  }
}

class AppColor {
  final pastelBlue = Color(0xFFAEE7FF);
  final pastelPink = Color(0xFFFFD1DC);
  final pastelOrange = Color(0xFFFFD8B1);
  final pastelPurple = Color(0xFFD7B5FF);
  final pastelMint = Color(0xFFB5EAD7);
  final pastelRed = Color(0xFFFF9AA2);
  final darkText = Color(0xFF36454F);
  final pastelGray = Color(0xFFB0B0B0);
  final scfld = Color(0xFFFFF5E1);
  final borderColor = Color(0xFFD9D9D9);
}
