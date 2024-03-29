import 'package:buysim_investment_tool_137/onbording/widget/onbo_ite_wid.dart';
import 'package:buysim_investment_tool_137/premium/pre_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';

class BiOnbording extends StatefulWidget {
  const BiOnbording({super.key});

  @override
  State<BiOnbording> createState() => _BiOnbordingState();
}

class _BiOnbordingState extends State<BiOnbording> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                currantPage = value;
              });
            },
            children: const [
              OnBoardingItem(
                titleOn: 'Learn to trade',
                desOn:
                    'Learn and start to trade now, easily with \nour trading simulator',
                imageOn: 'assets/images/onBoarding_one.png',
              ),
              OnBoardingItem(
                titleOn: 'Stocks statistics',
                desOn:
                    'Follow the latest statistics of popular \nstocks on the market',
                imageOn: 'assets/images/onBoarding_two.png',
              ),
              OnBoardingItem(
                titleOn: 'Read and learn',
                desOn:
                    'Read news about market giants, answer \ncorrectly in quiz, get bonuses to balance',
                imageOn: 'assets/images/onBoarding_three.png',
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 52.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 25, 29, 71),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 42, 47, 94),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                activeDotColor: BiColors.whate,
                                dotColor:
                                    const Color.fromARGB(164, 203, 189, 189),
                                dotHeight: 7.h,
                                dotWidth: 8.w,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 18.h,
                                fontWeight: FontWeight.w400,
                                color: BiColors.blue7B78AA,
                                height: 0.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 34.h,
                      lineWidth: 3.5.w,
                      percent: currantPage.toDouble() == 0
                          ? 0.25
                          : currantPage.toDouble() == 1
                              ? 0.75
                              : currantPage.toDouble() == 2
                                  ? 1
                                  : 0,
                      progressColor: BiColors.whate,
                      backgroundColor: const Color.fromARGB(164, 203, 189, 189),
                      center: BiMotion(
                        onPressed: () {
                          if (currantPage == 2) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PremiumScreen(),
                              ),
                              (protected) => false,
                            );
                          } else {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(30.r),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff0DA6C2),
                                Color(0xff0E39C6),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.r),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
