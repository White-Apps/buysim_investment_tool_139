import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/news/nw_cont.dart';
import 'package:buysim_investment_tool_137/news/nw_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            'News',
            style: TextStyle(
              fontSize: 26.h,
              fontWeight: FontWeight.w700,
              color: BiColors.whate,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: BiMotion(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 25, 29, 71),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: const Color.fromARGB(255, 69, 73, 129),
                    width: 0.7,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/wallet_icon.png',
                        width: 21.w,
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '500 USDT',
                            style: TextStyle(
                              fontSize: 14.h,
                              fontWeight: FontWeight.w500,
                              color: BiColors.whate,
                              height: 0,
                            ),
                          ),
                          Text(
                            'your balance',
                            style: TextStyle(
                              fontSize: 12.h,
                              fontWeight: FontWeight.w500,
                              color: BiColors.blue7B78AA,
                              height: 0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(20.r),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 25, 29, 71),
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: const Color.fromARGB(255, 69, 73, 129),
                  width: 0.7,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time left until the next news:',
                    style: TextStyle(
                      fontSize: 14.h,
                      fontWeight: FontWeight.w400,
                      color: BiColors.whate,
                    ),
                  ),
                  Text(
                    '00:14:24',
                    style: TextStyle(
                      fontSize: 14.h,
                      fontWeight: FontWeight.w700,
                      color: BiColors.whate,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 1,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) => NwWidget(
                        model: listNews[index],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
