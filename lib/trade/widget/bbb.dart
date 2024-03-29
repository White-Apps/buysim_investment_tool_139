import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ZenusButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function? press;

  const ZenusButton({
    super.key,
    required this.text,
    required this.color,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: 170.w,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          backgroundColor: color,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
            fontSize: 16.h,
            fontWeight: FontWeight.w400,
            color: BiColors.whate,
          ),
        ),
      ),
    );
  }
}
