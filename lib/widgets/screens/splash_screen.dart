import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, 'home_screen');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Lottie.asset("assets/m1.json",
            fit: BoxFit.cover,
            repeat: false,
            controller: controller, onLoaded: (composition) {
          controller.duration = composition.duration;
          controller.forward();
        }),
      ),
    );
  }
}
