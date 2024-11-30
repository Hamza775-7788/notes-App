import 'package:flutter/material.dart';

import 'package:note_app/view/screen/splashView.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences; 
void main() async {
  WidgetsFlutterBinding.ensureInitialized() ; 
  sharedPreferences = await SharedPreferences.getInstance() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
