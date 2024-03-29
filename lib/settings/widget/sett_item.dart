import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settingsitem extends StatelessWidget {
  const Settingsitem({
    super.key,
    required this.iconSet,
    required this.titleSet,
    this.width,
    required this.onPressed,
    this.isActivColor = false,
  });
  final String iconSet;
  final String titleSet;
  final double? width;
  final Function() onPressed;
  final bool isActivColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: BiMotion(
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isActivColor
                ? BiColors.yellowfe9900
                : const Color.fromARGB(255, 25, 29, 71),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: isActivColor
                  ? BiColors.yellowFFC700
                  : const Color.fromARGB(255, 54, 58, 113),
              width: isActivColor ? 1 : 0.7,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              children: [
                Image.asset(
                  iconSet,
                  width: width ?? 21.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  titleSet,
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: isActivColor ? BiColors.whate : BiColors.blue7B78AA,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
