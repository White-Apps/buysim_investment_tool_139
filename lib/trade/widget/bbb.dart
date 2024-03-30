import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ZenusButton extends StatelessWidget {
  final String text;
  final Function? press;
  final Color color1;
  final Color color2;
  const ZenusButton({
    super.key,
    required this.text,
    this.press,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    final double width = 200.0.w;
    final double height = 60.0.h;
    final double borderRadius = 20.0.r;

    return Expanded(
      child: BiMotion(
        onPressed: press as void Function()?,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                  colors: [color2, color1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Container(
              width: width - 4.w,
              height: height - 4.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(borderRadius - 2.r),
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: BiColors.whate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
