import 'dart:async';

import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/splash/spl_scr.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/cha_cub.dart';
import 'package:buysim_investment_tool_137/trade/cubit/balance_cubit.dart';
import 'package:buysim_investment_tool_137/trade/cubit/chart_cubit.dart';
import 'package:buysim_investment_tool_137/trade/cubit/currency_cubit.dart';
import 'package:buysim_investment_tool_137/trade/logic/cubits/get_trade_cubit/get_trade_cubit.dart';
import 'package:buysim_investment_tool_137/trade/logic/models/trade_model.dart';
import 'package:buysim_investment_tool_137/trade/logic/repositories/trade_repo.dart';
import 'package:buysim_investment_tool_137/trade/widget/methos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:apphud/apphud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/bi_dc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TradeHiveModelAdapter());

  runApp(const MyApp());
  await Apphud.start(apiKey: DocFF.bsdswqw);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Timer timer;
  late int _timeLeftInSeconds;
  int opwecds = 0;
  bool chek = false;
  @override
  void initState() {
    super.initState();
    ytfd();
  }

  Future<void> ytfd() async {
    bool chekawait = await gerPremBool();
    setState(() {
      chek = chekawait;
    });
    if (chek == true) {
      _loadOpwecds();
      _calculateTimeLeft();

      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          _timeLeftInSeconds--;
        });

        if (_timeLeftInSeconds <= 0) {
          _calculateTimeLeft();
          ssttt();
        }
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> ssttt() async {
    double previousBalance = UserPreferences.getBalance();
    double currentBalance = previousBalance + 100;
    await UserPreferences.setBalance(currentBalance);
    BlocProvider.of<BalanceCubit>(context).updateBalance(currentBalance);
    showCustomToast(context, 'You received a bonus', const Color(0xFF0DC271),
        const Color(0xFF0EA7C6));
  }

  void showCustomToast(
      BuildContext context, String title, Color color1, Color color2) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        content: Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                color1,
                color2,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                  color: BiColors.whate,
                ),
              ),
              Text(
                '100 USDT',
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w700,
                  color: BiColors.whate,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(seconds: 2),
        elevation: 0,
      ),
    );
  }

  void _loadOpwecds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    opwecds = prefs.getInt('Opwecds') ?? 0;
  }

  void _saveOpwecds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Opwecds', opwecds);
  }

  void _calculateTimeLeft() {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    const twentyFourHoursInMilliseconds = 24 * 60 * 60 * 1000;
    final elapsedTime = currentTime - opwecds;
    final remainingTime = twentyFourHoursInMilliseconds -
        (elapsedTime % twentyFourHoursInMilliseconds);
    setState(() {
      _timeLeftInSeconds = (remainingTime / 1000).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PlusCurCubitIUGBSD(),
          ),
          BlocProvider(
            create: (_) => ChartCubit(),
          ),
          BlocProvider(
            create: (context) => BalanceCubit(),
          ),
          BlocProvider(
            create: (context) => CurrencyPairCubit(),
          ),
          BlocProvider(
            create: (context) => GetTradeCubit(TradeRepoImpl()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BuySim: Investment Tool',
          home: const SplashScreen(),
          theme: ThemeData(
            fontFamily: 'SFProDisplay',
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
    );
  }
}

Future<bool> gerPremBool() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('gerPremBool') ?? false;
}

Future<void> serPremBool(bool calcul) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('gerPremBool', calcul);
}
