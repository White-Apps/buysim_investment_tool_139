import 'dart:math';
import 'dart:ui';

import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/news/nw_cont.dart';
import 'package:buysim_investment_tool_137/premium/pre_scr.dart';
import 'package:buysim_investment_tool_137/settings/buysim_investment_prenvdf.dart';
import 'package:buysim_investment_tool_137/trade/cubit/balance_cubit.dart';
import 'package:buysim_investment_tool_137/trade/widget/methos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String selectedAnswer = '';
  int usdt = 0;
  int getRandomSteps() {
    return Random().nextInt(10 - 5) + 5;
  }

  @override
  void initState() {
    usdt = getRandomSteps();
    super.initState();
  }

  void checkSelectedAnswer() async {
    if (selectedAnswer == answerTrue) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xff0E39C6),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Correct answer gain:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                '$usdt USDT',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      double previousBalance = UserPreferences.getBalance();
      double currentBalance = previousBalance + usdt;
      await UserPreferences.setBalance(currentBalance);
      BlocProvider.of<BalanceCubit>(context).updateBalance(currentBalance);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffF03737),
          content: Center(
            child: Text(
              'Wrong answer!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

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
        FutureBuilder(
            future: getBuysimInvestmentPedf(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (!snapshot.data!) {
                  return Stack(
                    children: [
                      IgnorePointer(
                        child: Opacity(
                          opacity: 0.5,
                          child: ImageFiltered(
                            imageFilter:
                                ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                            child: Column(
                              children: [
                                buildOptionContainer(0,
                                    'a) ${listAns[0]}'), // Call function for each option
                                SizedBox(height: 10.h),
                                buildOptionContainer(1, 'b) ${listAns[1]}'),
                                SizedBox(height: 10.h),
                                buildOptionContainer(2, 'c) ${listAns[2]}'),
                                SizedBox(height: 10.h),
                                buildOptionContainer(3, 'd) ${listAns[3]}'),
                                SizedBox(height: 16.h),
                                BiMotion(
                                  onPressed: () {
                                    if (answerTrue.isEmpty) {
                                      setState(() {
                                        answerTrue = widget.model.answer;
                                        checkSelectedAnswer(); // Call function to check answer
                                      });
                                    }
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
                                      color:
                                          const Color.fromARGB(255, 25, 29, 71),
                                      borderRadius: BorderRadius.circular(50.h),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: IntrinsicHeight(
                            child: BiMotion(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PremiumScreen(isClose: true),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                  color: BiColors.yellowfe9900,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 54, 58, 113),
                                    width: 0.7,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Get Premium to unlock tests',
                                    style: TextStyle(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.w600,
                                      color: BiColors.whate,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    buildOptionContainer(
                        0, 'a) ${listAns[0]}'), // Call function for each option
                    SizedBox(height: 10.h),
                    buildOptionContainer(1, 'b) ${listAns[1]}'),
                    SizedBox(height: 10.h),
                    buildOptionContainer(2, 'c) ${listAns[2]}'),
                    SizedBox(height: 10.h),
                    buildOptionContainer(3, 'd) ${listAns[3]}'),
                    SizedBox(height: 16.h),
                    BiMotion(
                      onPressed: () {
                        if (answerTrue.isEmpty) {
                          setState(() {
                            answerTrue = widget.model.answer;
                            checkSelectedAnswer(); // Call function to check answer
                          });
                        }
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
                          borderRadius: BorderRadius.circular(50.h),
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
                  ],
                );
              }
              return const SizedBox();
            }),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget buildOptionContainer(int index, String text) {
    return BiMotion(
      onPressed: () {
        setState(() {
          selectedAnswer = listAns[index];
        });
      },
      child: Container(
        padding: EdgeInsets.all(20.r),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: answerTrue == listAns[index]
              ? BiColors.green.withOpacity(0.5) // Set green for correct answer
              : (selectedAnswer == listAns[index]
                  ? (answerTrue.isEmpty
                      ? const Color.fromARGB(255, 25, 29, 71)
                      : BiColors.red.withOpacity(
                          0.5)) // Red for wrong selection after confirm
                  : const Color.fromARGB(
                      255, 25, 29, 71)), // Default background color
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            color: selectedAnswer == listAns[index]
                ? const Color(0xff0DA6C2)
                : const Color.fromARGB(255, 69, 73, 129),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.h,
            fontWeight: FontWeight.w400,
            color: BiColors.whate,
          ),
        ),
      ),
    );
  }
}
