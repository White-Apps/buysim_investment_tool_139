import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/splash/spl_scr.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/cha_cub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) => PlusCurCubitIUGBSD(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BuySim: Investment Tool',
          home: child,
          theme: ThemeData(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: BiColors.blue19173D,
            appBarTheme: const AppBarTheme(
              backgroundColor: BiColors.blue19173D,
            ),
          ),
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
