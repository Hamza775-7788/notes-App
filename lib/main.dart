import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:note_app/view/screen/splashView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => AccessibilityTools(
        enableButtonsDrag: true,
        checkFontOverflows: true,
        checkImageLabels: true,
        child: child,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
