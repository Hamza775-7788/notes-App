import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/view/screen/homeView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'asset/images/splashNote.png',
              height: 100,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text('by hamza abbas '))
          ],
        ),
      ),
    );
  }
}
