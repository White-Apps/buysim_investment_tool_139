import 'dart:async';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/news/nw_cont.dart';
import 'package:buysim_investment_tool_137/news/nw_widget.dart';
import 'package:buysim_investment_tool_137/trade/cubit/balance_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NwScreen extends StatefulWidget {
  const NwScreen({super.key});

  @override
  _NwScreenState createState() => _NwScreenState();
}

class _NwScreenState extends State<NwScreen> {
  late Timer _timer;
  late int _timeLeftInSeconds;
  int _lastNewsIndex = 0;
  final List<NwModel> newsList = listNews;

  @override
  void initState() {
    super.initState();
    _loadLastNewsIndex();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _timeLeftInSeconds--;
      });
      if (_timeLeftInSeconds <= 0) {
        _showNextNews();
        _calculateTimeLeft();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _loadLastNewsIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _lastNewsIndex = prefs.getInt('lastNewsIndex') ?? 0;
  }

  void _saveLastNewsIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastNewsIndex', _lastNewsIndex);
  }

  void _calculateTimeLeft() {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    const fiveHoursInMilliseconds = 5 * 60 * 60 * 1000;
    final elapsedTime = currentTime - _lastNewsIndex;
    final remainingTime =
        fiveHoursInMilliseconds - (elapsedTime % fiveHoursInMilliseconds);
    setState(() {
      _timeLeftInSeconds = (remainingTime / 1000).round();
    });
  }

  void _showNextNews() {
    setState(() {
      _lastNewsIndex = (_lastNewsIndex + 1) % newsList.length;
    });
    _saveLastNewsIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            'News',
            style: TextStyle(
              fontSize: 26.h,
              fontWeight: FontWeight.w700,
              color: BiColors.whate,
            ),
          ),
        ),
        actions: [
          BlocBuilder<BalanceCubit, double>(
            builder: (context, balance) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: BiMotion(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 25, 29, 71),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: const Color.fromARGB(255, 69, 73, 129),
                        width: 0.7,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/wallet_icon.png',
                            width: 21.w,
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${"${balance.toStringAsFixed(0)} \$"} USDT',
                                style: TextStyle(
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w500,
                                  color: BiColors.whate,
                                  height: 0,
                                ),
                              ),
                              Text(
                                'your balance',
                                style: TextStyle(
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w500,
                                  color: BiColors.blue7B78AA,
                                  height: 0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(20.r),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 25, 29, 71),
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                    color: const Color.fromARGB(255, 69, 73, 129),
                    width: 0.7,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time left until the next news:',
                      style: TextStyle(
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                        color: BiColors.whate,
                      ),
                    ),
                    Text(
                      '${_timeLeftInSeconds ~/ 3600}:${(_timeLeftInSeconds % 3600 ~/ 60).toString().padLeft(2, '0')}:${(_timeLeftInSeconds % 60).toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 14.h,
                        fontWeight: FontWeight.w700,
                        color: BiColors.whate,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) => NwWidget(
                        model: newsList[_lastNewsIndex],
                      )),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
