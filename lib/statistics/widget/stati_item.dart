import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/statistics/model/statistics_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatiItem extends StatelessWidget {
  const StatiItem({
    super.key,
    required this.onPressed,
    this.isBan = false,
    required this.model,
    required this.acvtiv,
  });
  final StatisticsModel model;
  final String acvtiv;
  final Function() onPressed;
  final bool isBan;

  @override
  Widget build(BuildContext context) {
    return BiMotion(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: const Color.fromARGB(255, 53, 57, 113),
            width: 0.7,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    model.image,
                    width: 47.w,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '(${model.nameCompany})',
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w500,
                          color: BiColors.whate,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      FittedBox(
                        child: Text(
                          model.dec,
                          style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w500,
                            color: BiColors.blue7B78AA,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    '\$$acvtiv',
                    style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.w500,
                      color: BiColors.redE31212,
                      height: 0,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Image.asset(
                    'assets/icons/bancr_icon.png',
                    // 'assets/icons/bluss_icon.png',
                    width: 12.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
