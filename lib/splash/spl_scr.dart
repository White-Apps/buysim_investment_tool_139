import 'package:buysim_investment_tool_137/core/con_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    firstOpen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 250.w,
              height: 250.h,
            ),
          ),
        ],
      ),
    );
  }

  firstOpen() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BiBottomBar(),
      ),
    );
  }
}
