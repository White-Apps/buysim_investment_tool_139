import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.titleOn,
    required this.desOn,
    required this.imageOn,
  });
  final String titleOn;
  final String desOn;
  final String imageOn;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imageOn,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          // alignment: Alignment.center,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 40.h,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                children: [
                  Text(
                    titleOn,
                    style: TextStyle(
                      fontSize: 26.h,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.5.h,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      desOn,
                      style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w400,
                        color: BiColors.blue7B78AA,
                        height: 1.3.h,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
