import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/news/nw_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NwWidget extends StatefulWidget {
  const NwWidget({super.key, required this.model});
  final NwModel model;

  @override
  State<NwWidget> createState() => _NwWidgetState();
}

class _NwWidgetState extends State<NwWidget> {
  late List<String> listAns = widget.model.listAnsw;
  String answerTrue = '';
  String isActive = '';
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  '(${widget.model.name})',
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
                    widget.model.company,
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
        SizedBox(height: 16.h),
        Text(
          widget.model.subTitle,
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
          widget.model.questions,
          style: TextStyle(
            fontSize: 18.h,
            fontWeight: FontWeight.w500,
            color: BiColors.whate,
          ),
        ),
        SizedBox(height: 16.h),
        BiMotion(
          onPressed: () {
            setState(() {
              isActive = listAns[0];
            });
          },
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: answerTrue == listAns[0]
                  ? BiColors.green.withOpacity(0.5)
                  : const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: isActive == listAns[0]
                    ? const Color(0xff0DA6C2)
                    : const Color.fromARGB(255, 69, 73, 129),
              ),
            ),
            child: Text(
              'a) ${listAns[0]}',
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
          onPressed: () {
            setState(() {
              isActive = listAns[1];
            });
          },
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: answerTrue == listAns[1]
                  ? BiColors.green.withOpacity(0.5)
                  : const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: isActive == listAns[1]
                    ? const Color(0xff0DA6C2)
                    : const Color.fromARGB(255, 69, 73, 129),
              ),
            ),
            child: Text(
              'b) ${listAns[1]}',
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
          onPressed: () {
            setState(() {
              isActive = listAns[2];
            });
          },
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: answerTrue == listAns[2]
                  ? BiColors.green.withOpacity(0.5)
                  : const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: isActive == listAns[2]
                    ? const Color(0xff0DA6C2)
                    : const Color.fromARGB(255, 69, 73, 129),
              ),
            ),
            child: Text(
              'c) ${listAns[2]}',
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
          onPressed: () {
            setState(() {
              isActive = listAns[3];
            });
          },
          child: Container(
            padding: EdgeInsets.all(20.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: answerTrue == listAns[3]
                  ? BiColors.green.withOpacity(0.5)
                  : const Color.fromARGB(255, 25, 29, 71),
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: isActive == listAns[3]
                    ? const Color(0xff0DA6C2)
                    : const Color.fromARGB(255, 69, 73, 129),
              ),
            ),
            child: Text(
              'd) ${listAns[3]}',
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
          onPressed: () {
            setState(() {
              answerTrue = widget.model.answer;
            });
          },
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
