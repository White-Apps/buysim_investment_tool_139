import 'dart:async';

import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/statistics/model/statistics_model.dart';
import 'package:buysim_investment_tool_137/trade/charts/candle_chart.dart';
import 'package:buysim_investment_tool_137/trade/charts/linear_chart.dart';
import 'package:buysim_investment_tool_137/trade/cubit/balance_cubit.dart';
import 'package:buysim_investment_tool_137/trade/cubit/chart_cubit.dart';
import 'package:buysim_investment_tool_137/trade/cubit/chart_state.dart';
import 'package:buysim_investment_tool_137/trade/cubit/currency_cubit.dart';
import 'package:buysim_investment_tool_137/trade/logic/cubits/set_trade_cubit/set_trade_cubit.dart';
import 'package:buysim_investment_tool_137/trade/logic/models/trade_model.dart';
import 'package:buysim_investment_tool_137/trade/logic/repositories/trade_repo.dart';
import 'package:buysim_investment_tool_137/trade/widget/amount_widget.dart';
import 'package:buysim_investment_tool_137/trade/widget/bbb.dart';
import 'package:buysim_investment_tool_137/trade/widget/methos.dart';
import 'package:buysim_investment_tool_137/trade/widget/stati_item_trade.dart';
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
  late String ttt = statisticsList.first.nameCompany;
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

  @override
  void dispose() {
    _buySignalController.close();
    super.dispose();
  }

  void showCustomToast(BuildContext context, String message, String title,
      Color color1, Color color2) {
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
                '$message USDT',
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

  bool ccc = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              AbsorbPointer(
                absorbing: opacity < 1.0,
                child: Opacity(
                  opacity: opacity,
                  child: SizedBox(
                    height: 70.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(0.r),
                      itemBuilder: (context, state) {
                        return BiMotion(
                          onPressed: () {
                            if (mounted) {
                              BlocProvider.of<CurrencyPairCubit>(context)
                                  .changeCurrencyPair(
                                      statisticsList[state].nameCompany);

                              setState(() {
                                ttt = statisticsList[state].nameCompany;
                              });
                            }
                          },
                          child: StatiItemTrade(
                            model: statisticsList[state],
                            chek: ttt == statisticsList[state].nameCompany,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10.w),
                      itemCount: statisticsList.length,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              AbsorbPointer(
                absorbing: opacity < 1.0,
                child: Opacity(
                  opacity: opacity,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: AmountTradeWidget(
                          onAmountEntered: onAmountEntered,
                          ooo: (value) {
                            setState(() {
                              ccc = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: TimeDropdownTradeWidget(
                          onTimeSelected: onTimeSelected,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 333.h,
                    margin: EdgeInsets.only(top: 20.r),
                    child: BlocBuilder<ChartCubit, ChartState>(
                      builder: (context, state) {
                        if (state.type == ChartType.linear) {
                          return LinearChartWidget(
                            selectedTime: selectedTime,
                            buySignalStream: _buySignalController.stream,
                            selectedAmount: selectedAmount,
                          );
                        } else if (state.type == ChartType.candlestick) {
                          return CandleChart(
                            selectedTime: selectedTime,
                            buySignalStream: _buySignalController.stream,
                            selectedAmount: selectedAmount,
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 16,
                    child: Container(
                      padding: EdgeInsets.all(5.r),
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(13.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.15),
                        ),
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
                                      height: 35.h,
                                      width: 35.w,
                                      padding: EdgeInsets.all(7.5.r),
                                      decoration: BoxDecoration(
                                        gradient: state.isLinear
                                            ? const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: <Color>[
                                                  Color(0xFF0DA6C2),
                                                  Color(0xFF0E39C6),
                                                ],
                                              )
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Image.asset(
                                          "assets/images/graph1.png",
                                          width: 35.w),
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
                                      height: 35.h,
                                      width: 35.w,
                                      padding: EdgeInsets.all(7.5.r),
                                      decoration: BoxDecoration(
                                        gradient: state.isCandlestick
                                            ? const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: <Color>[
                                                  Color(0xFF0DA6C2),
                                                  Color(0xFF0E39C6),
                                                ],
                                              )
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Image.asset(
                                          "assets/images/graph2.png",
                                          width: 35.w),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21.h),
              BlocProvider(
                create: (context) => SetTradeCubit(TradeRepoImpl()),
                child: BlocConsumer<SetTradeCubit, SetTradeState>(
                  listener: (context, state) {
                    if (state is Success) {
                    } else if (state is Error) {
                      final errorMessage = state.e;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $errorMessage')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is Loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return AbsorbPointer(
                      absorbing: opacity < 1.0,
                      child: Opacity(
                        opacity: opacity,
                        child: Row(
                          children: [
                            ZenusButton(
                              text: 'BUY',
                              color1: const Color(0xFF0DA6C2),
                              color2: const Color(0xFF0E39C6),
                              press: () async {
                                if (ccc == false) {
                                  bool chek = false;
                                  double previousBalance =
                                      UserPreferences.getBalance();
                                  double currentBalance =
                                      previousBalance - selectedAmount;
                                  await UserPreferences.setBalance(
                                      currentBalance);
                                  BlocProvider.of<BalanceCubit>(context)
                                      .updateBalance(currentBalance);

                                  setState(() {
                                    opacity = 0.5;
                                  });

                                  int timeInMinutes = int.tryParse(
                                          selectedTime.split(' ')[0]) ??
                                      1;
                                  Duration duration =
                                      Duration(minutes: timeInMinutes);

                                  await Future.delayed(duration);

                                  _buySignalController.add(true);

                                  double newBalance = UserPreferences
                                      .getBalance(); // Предположим, что баланс может измениться в результате других операций

                                  if (newBalance > previousBalance) {
                                    showCustomToast(
                                        context,
                                        selectedAmount.toString(),
                                        'You won:',
                                        const Color(0xFF0DC271),
                                        const Color(0xFF0EA7C6));
                                    setState(() {
                                      chek = true;
                                    });
                                  } else {
                                    showCustomToast(
                                        context,
                                        selectedAmount.toString(),
                                        'You loss:',
                                        const Color(0xFFC25F0D),
                                        const Color(0xFFC60E27));
                                    setState(() {
                                      chek = false;
                                    });
                                  }

                                  TradeHiveModel tradeHiveModel =
                                      TradeHiveModel(
                                          id: DateTime.now()
                                              .millisecondsSinceEpoch,
                                          sum: selectedAmount,
                                          chek: chek,
                                          date: DateTime.now(),
                                          title: ttt);

                                  context
                                      .read<SetTradeCubit>()
                                      .setTrade(tradeHiveModel);

                                  setState(() {
                                    opacity = 1.0;
                                  });
                                }
                              },
                            ),
                            SizedBox(width: 8.w),
                            ZenusButton(
                              text: 'SELL',
                              color1: const Color(0xFFC25F0D),
                              color2: const Color(0xFFC60E27),
                              press: () async {
                                if (ccc == false) {
                                  bool chek = false;
                                  double previousBalance =
                                      UserPreferences.getBalance();
                                  double currentBalance =
                                      previousBalance - selectedAmount;
                                  await UserPreferences.setBalance(
                                      currentBalance);
                                  BlocProvider.of<BalanceCubit>(context)
                                      .updateBalance(currentBalance);

                                  setState(() {
                                    opacity = 0.5;
                                  });

                                  int timeInMinutes = int.tryParse(
                                          selectedTime.split(' ')[0]) ??
                                      1;
                                  Duration duration =
                                      Duration(minutes: timeInMinutes);

                                  await Future.delayed(duration);

                                  _buySignalController.add(true);

                                  double newBalance = UserPreferences
                                      .getBalance(); // Предположим, что баланс может измениться в результате других операций

                                  if (newBalance > previousBalance) {
                                    showCustomToast(
                                        context,
                                        selectedAmount.toString(),
                                        'You won:',
                                        const Color(0xFF0DC271),
                                        const Color(0xFF0EA7C6));
                                    setState(() {
                                      chek = true;
                                    });
                                  } else {
                                    showCustomToast(
                                        context,
                                        selectedAmount.toString(),
                                        'You loss:',
                                        const Color(0xFFC25F0D),
                                        const Color(0xFFC60E27));
                                    setState(() {
                                      chek = false;
                                    });
                                  }

                                  TradeHiveModel tradeHiveModel =
                                      TradeHiveModel(
                                          id: DateTime.now()
                                              .millisecondsSinceEpoch,
                                          sum: selectedAmount,
                                          chek: chek,
                                          date: DateTime.now(),
                                          title: ttt);

                                  context
                                      .read<SetTradeCubit>()
                                      .setTrade(tradeHiveModel);

                                  setState(() {
                                    opacity = 1.0;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
