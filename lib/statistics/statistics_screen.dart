// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buysim_investment_tool_137/statistics/model/statistics_model.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/statistics_detail.dart';
import 'package:buysim_investment_tool_137/statistics/widget/stati_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
          Padding(
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
                            '500 USDT',
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StatisticsDetail(
                            modelDetail: listModel,
                          ),
                        ),
                      );
                    },
                    acvtiv: '103.56 / -18%',
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
