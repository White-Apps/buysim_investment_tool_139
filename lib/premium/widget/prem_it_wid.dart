import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiItem extends StatelessWidget {
  const PremiItem({
    super.key,
    required this.iconPre,
    required this.titlePre,
  });
  final String iconPre;
  final String titlePre;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPre,
          width: 22.w,
          height: 22.h,
          color: BiColors.whate.withOpacity(0.5),
        ),
        SizedBox(width: 10.w),
        FittedBox(
          child: Text(
            titlePre,
            style: TextStyle(
              color: BiColors.blue7B78AA,
              fontSize: 16.h,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
