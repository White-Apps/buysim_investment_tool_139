import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/news/nw_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NwWidget extends StatelessWidget {
  const NwWidget({super.key, required this.model});
  final NwModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 48.h),
        Text(
          '''"Microsoft Introduces New Version of Windows with Enhanced Security"
"Microsoft Acquires Leading Artificial Intelligence Company"
"Microsoft Develops Cloud Service for Hospital Management"''',
          style: TextStyle(
            fontSize: 14.h,
            fontWeight: FontWeight.w400,
            color: BiColors.blue7B78AA,
          ),
        ),
        const Divider(
          height: 32,
          color: Color.fromARGB(255, 69, 73, 129),
        ),
        Text(
          'The company that owns the platforms Facebook, Instagram, and WhatsApp is...',
          style: TextStyle(
            fontSize: 18.h,
            fontWeight: FontWeight.w500,
            color: BiColors.whate,
          ),
        ),
        SizedBox(height: 16.h),
        BiMotion(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: const Color.fromARGB(255, 69, 73, 129),
              ),
            ),
            child: Text(
              'a) Facebook Inc. (FB)',
              style: TextStyle(
                fontSize: 14.h,
                fontWeight: FontWeight.w400,
                color: BiColors.whate,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        BiMotion(
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: const Color.fromARGB(255, 69, 73, 129),
              ),
            ),
            child: Text(
              'a) Facebook Inc. (FB)',
              style: TextStyle(
                fontSize: 14.h,
                fontWeight: FontWeight.w400,
                color: BiColors.whate,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        BiMotion(
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: const Color.fromARGB(255, 69, 73, 129),
              ),
            ),
            child: Text(
              'a) Facebook Inc. (FB)',
              style: TextStyle(
                fontSize: 14.h,
                fontWeight: FontWeight.w400,
                color: BiColors.whate,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        BiMotion(
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: const Color.fromARGB(255, 69, 73, 129),
                //  const Color(0xff0DA6C2),
              ),
            ),
            child: Text(
              'a) Facebook Inc. (FB)',
              style: TextStyle(
                fontSize: 14.h,
                fontWeight: FontWeight.w400,
                color: BiColors.whate,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        BiMotion(
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xff0DA6C2),
                  Color(0xff0E39C6),
                ],
              ),
              color: const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: const Color(0xff0DA6C2),
              ),
            ),
            child: Center(
              child: Text(
                'Confirm Answer',
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: BiColors.whate,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
