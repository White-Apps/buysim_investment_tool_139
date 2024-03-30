import 'package:buysim_investment_tool_137/statistics/statistics_detail/bottom_sheet.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/cha_cub.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/pageVi.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/char.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/statistics/model/statistics_model.dart';

class StatisticsDetail extends StatefulWidget {
  const StatisticsDetail({
    super.key,
    required this.modelDetail,
    required this.acsi,
    required this.port,
  });
  final StatisticsModel modelDetail;
  final double acsi;
  final int port;
  @override
  State<StatisticsDetail> createState() => _StatisticsDetailState();
}

class _StatisticsDetailState extends State<StatisticsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55.h,
        leading: Padding(
          padding: EdgeInsets.only(left: 19.w),
          child: BiMotion(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 22.w,
              color: BiColors.whate,
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          widget.modelDetail.nameCompany,
          style: TextStyle(
            fontSize: 20.h,
            fontWeight: FontWeight.w700,
            color: BiColors.whate,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  widget.modelDetail.image,
                  width: 60.w,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '(${widget.modelDetail.nameCompany})',
                      style: TextStyle(
                        fontSize: 19.h,
                        fontWeight: FontWeight.w500,
                        color: BiColors.whate,
                        height: 0,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        widget.modelDetail.dec,
                        style: TextStyle(
                          fontSize: 19.h,
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
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  '\$${widget.acsi} / ${widget.port}%',
                  style: TextStyle(
                    fontSize: 30.h,
                    fontWeight: FontWeight.w500,
                    color: widget.port < 0
                        ? BiColors.redE31212
                        : BiColors.green1BE312,
                    height: 0,
                  ),
                ),
                SizedBox(width: 5.w),
                Image.asset(
                  widget.port < 0
                      ? 'assets/icons/bancr_icon.png'
                      : 'assets/icons/bluss_icon.png',
                  width: 16.w,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            PlusCurTogglePOJcamcasasd(
              onTimeframeSelected: (index) {
                context.read<PlusCurCubitIUGBSD>().oihjfnvewvwvvrev(index);
                context.read<PlusCurCubitIUGBSD>().kmvskmdvsdvsdv(index);
              },
            ),
            SizedBox(height: 35.h),
            const PlusCurChartkjbscjdvs(),
            SizedBox(height: 12.h),
            BiMotion(
              onPressed: () {
                bottomShet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 25, 29, 71),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: const Color.fromARGB(255, 55, 59, 114),
                    width: 0.7,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/clock.png',
                        width: 24.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Trading History',
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w600,
                          color: BiColors.blue7B78AA,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
