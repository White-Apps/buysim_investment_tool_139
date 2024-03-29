import 'dart:async';
import 'dart:math';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/statistics_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/statistics/model/statistics_model.dart';

class StatiItem extends StatefulWidget {
  const StatiItem({
    super.key,
    required this.model,
  });

  final StatisticsModel model;

  @override
  State<StatiItem> createState() => _StatiItemState();
}

class _StatiItemState extends State<StatiItem> {
  late double randomNumberDouble;
  late int randomNumberInt;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    generateRandomNumberDouble();
    randomNumberInt = generateRandomNumberInt();
    timer = Timer.periodic(const Duration(hours: 1), (Timer t) {
      generateRandomNumberDouble();
      randomNumberInt = generateRandomNumberInt();
    });
  }

  void generateRandomNumberDouble() {
    final random = Random();
    setState(() {
      randomNumberDouble = (random.nextDouble() * 50 + 100).toDouble();
      randomNumberDouble = double.parse(randomNumberDouble.toStringAsFixed(2));
    });
  }

  int generateRandomNumberInt() {
    Random random = Random();
    return random.nextInt(51) - 20;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BiMotion(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StatisticsDetail(
              modelDetail: widget.model,
              acsi: randomNumberDouble,
              port: randomNumberInt,
            ),
          ),
        );
      },
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
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    '\$$randomNumberDouble / $randomNumberInt%',
                    style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.w500,
                      color: randomNumberInt < 0
                          ? BiColors.redE31212
                          : BiColors.green1BE312,
                      height: 0,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Image.asset(
                    randomNumberInt < 0
                        ? 'assets/icons/bancr_icon.png'
                        : 'assets/icons/bluss_icon.png',
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
