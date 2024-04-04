import 'package:buysim_investment_tool_137/core/con_bar.dart';
import 'package:buysim_investment_tool_137/onbording/onbo.dart';
import 'package:buysim_investment_tool_137/splash/buysim_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    firstOpen(context);
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

  firstOpen(BuildContext context) async {
    final buysimprefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 700));
    if (buysimprefs.containsKey('buysimKey')) {
      final cachedbuysimLink = buysimprefs.getString('buysimKey') ?? '';
      if (cachedbuysimLink.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BiBottomBar(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => BuySimView(
              buysimLink: cachedbuysimLink,
            ),
          ),
        );
      }
    } else {
      final buysimfbResponse = await Dio().get(
        'https://buysim-investment-tool-default-rtdb.firebaseio.com/buysim.json?auth=AIzaSyDxRTO2KqedO4ixfC2ovaw9l5uwjB-Hs2U',
      );
      String? buysimpath = buysimfbResponse.data['link'] as String?;

      if (buysimpath != null && buysimpath.isNotEmpty) {
        if (buysimpath.contains('(click_id)')) {
          final oneSignalSubscriptionId = OneSignal.User.pushSubscription.id;
          buysimpath = buysimpath.replaceAll('(click_id)',
              '$oneSignalSubscriptionId:d2517776-d274-4caa-8cb8-f168d4dd601b');
        }
        final realLinkResponse = await Dio().get(buysimpath);
        buysimpath = realLinkResponse.realUri.toString();
        buysimprefs.setString('buysimInitial', buysimpath);
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => BuySimView(buysimLink: buysimpath!)));
      } else {
        buysimprefs.setString('buysimKey', '');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const BiOnbording(),
          ),
        );
      }
    }
  }
}
