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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TradeHiveModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTradeCubit(TradeRepoImpl()),
      child: ScreenUtilInit(
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
          ],
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
      ),
    );
  }
}
