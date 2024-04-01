import 'package:buysim_investment_tool_137/statistics/model/statistics_model.dart';
import 'package:buysim_investment_tool_137/statistics/widget/stati_item.dart';
import 'package:buysim_investment_tool_137/trade/cubit/balance_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            'Statistics',
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
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                itemBuilder: (context, index) {
                  final listModel = statisticsList[index];
                  return StatiItem(
                    model: listModel,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: statisticsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
