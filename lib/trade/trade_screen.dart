import 'dart:async';

import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/premium/pre_scr.dart';
import 'package:buysim_investment_tool_137/trade/charts/candle_chart.dart';
import 'package:buysim_investment_tool_137/trade/charts/linear_chart.dart';
import 'package:buysim_investment_tool_137/trade/cubit/balance_cubit.dart';
import 'package:buysim_investment_tool_137/trade/cubit/chart_cubit.dart';
import 'package:buysim_investment_tool_137/trade/cubit/chart_state.dart';
import 'package:buysim_investment_tool_137/trade/widget/amount_widget.dart';
import 'package:buysim_investment_tool_137/trade/widget/bbb.dart';
import 'package:buysim_investment_tool_137/trade/widget/currency_pair.dart';
import 'package:buysim_investment_tool_137/trade/widget/methos.dart';
import 'package:buysim_investment_tool_137/trade/widget/time_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  String selectedTime = '1 min';
  double selectedAmount = 100;
  StreamController<bool> _buySignalController = StreamController<bool>();
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _buySignalController = StreamController<bool>.broadcast();
  }

  void onTimeSelected(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  void onAmountEntered(double amount) {
    setState(() {
      selectedAmount = amount;
    });
  }

  void onBuyPressed() {
    int timeInMinutes = int.tryParse(selectedTime.split(' ')[0]) ?? 1;
    Duration duration = Duration(minutes: timeInMinutes);

    setState(() {
      opacity = 0.5;
    });

    Future.delayed(duration).then((_) {
      _buySignalController.add(true);

      setState(() {
        opacity = 1.0;
      });
    });
    // ignore: avoid_print
    print("Началось");
  }

  @override
  void dispose() {
    _buySignalController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            'Simulator',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // const BalanceTradeWidget(),
                SizedBox(width: 16.w),
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: BiColors.whate.withOpacity(0.08),
                    border: Border.all(
                      color: BiColors.whate.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: <Widget>[
                      BlocBuilder<ChartCubit, ChartState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () => context
                                    .read<ChartCubit>()
                                    .toggleChart(ChartType.linear),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: state.isLinear
                                        ? const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: <Color>[
                                              Color(0xFF3F8E00),
                                              Color(0xFFFAFF00),
                                            ],
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child:
                                      Image.asset("assets/images/graph1.png"),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<ChartCubit>()
                                      .toggleChart(ChartType.candlestick);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: state.isCandlestick
                                        ? const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: <Color>[
                                              Color(0xFF3F8E00),
                                              Color(0xFFFAFF00),
                                            ],
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child:
                                      Image.asset("assets/images/graph2.png"),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      const SizedBox.shrink(),
                      // FutureBuilder<bool>(
                      //   future: buyZenusFuncGet(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.data == false) {
                      //       return Padding(
                      //         padding: EdgeInsets.only(left: 8.w),
                      //         child: Image.asset(
                      //           "assets/images/starPrem.png",
                      //           height: 16.h,
                      //           width: 16.w,
                      //         ),
                      //       );
                      //     }
                      //     return const SizedBox.shrink();
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            BlocBuilder<ChartCubit, ChartState>(
              builder: (context, state) {
                if (state.type == ChartType.linear) {
                  return LinearChartWidget(
                    selectedTime: selectedTime,
                    buySignalStream: _buySignalController.stream,
                    selectedAmount: selectedAmount,
                  );
                } else if (state.type == ChartType.candlestick) {
                  return const CandleChart();
                }
                return Container();
              },
            ),
            SizedBox(height: 24.h),
            AbsorbPointer(
              absorbing: opacity < 1.0,
              child: Opacity(
                opacity: opacity,
                child: Row(
                  children: <Widget>[
                    AmountTradeWidget(
                      onAmountEntered: onAmountEntered,
                    ),
                    SizedBox(width: 8.w),
                    const Expanded(
                      child: CurrencyPairTradeWidget(),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TimeDropdownTradeWidget(
                        onTimeSelected: onTimeSelected,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            AbsorbPointer(
              absorbing: opacity < 1.0,
              child: Opacity(
                opacity: opacity,
                child: Row(
                  children: [
                    Expanded(
                      child: ZenusButton(
                        text: 'SELL',
                        color: BiColors.red,
                        press: () {
                          double currentBalance = UserPreferences.getBalance();
                          UserPreferences.setBalance(
                            currentBalance - selectedAmount,
                          );
                          UserPreferences.setBalance(
                                  currentBalance - selectedAmount)
                              .then((_) {
                            BlocProvider.of<BalanceCubit>(context)
                                .updateBalance(currentBalance - selectedAmount);
                          });
                          onBuyPressed();
                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: ZenusButton(
                        text: 'BUY',
                        color: BiColors.green,
                        press: () {
                          double currentBalance = UserPreferences.getBalance();
                          UserPreferences.setBalance(
                            currentBalance - selectedAmount,
                          );
                          UserPreferences.setBalance(
                                  currentBalance - selectedAmount)
                              .then((_) {
                            BlocProvider.of<BalanceCubit>(context)
                                .updateBalance(currentBalance - selectedAmount);
                          });
                          onBuyPressed();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
