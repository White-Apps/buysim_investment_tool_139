import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/statistics/model/statistics_model.dart';

class StatiItemTrade extends StatefulWidget {
  const StatiItemTrade({
    super.key,
    required this.model,
    required this.chek,
  });

  final StatisticsModel model;

  final bool chek;
  @override
  State<StatiItemTrade> createState() => _StatiItemTradeState();
}

class _StatiItemTradeState extends State<StatiItemTrade> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: widget.chek ? BiColors.blue262450 : Colors.transparent,
        border: Border.all(
          color: widget.chek
              ? const Color(0xFF0E39C6)
              : const Color.fromARGB(255, 53, 57, 113),
          width: 0.7,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
        child: Row(
          children: [
            Image.asset(
              widget.model.image,
              width: 47.w,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '(${widget.model.nameCompany})',
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
                    widget.model.dec,
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
      ),
    );
  }
}
