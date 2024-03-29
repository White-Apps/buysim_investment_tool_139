import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/news/news_screen.dart';
import 'package:buysim_investment_tool_137/settings/setti_scre.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_screen.dart';
import 'package:buysim_investment_tool_137/trade/trade_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BiBottomBarState extends State<BiBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: isActive,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 18.r,
          bottom: 40.r,
        ),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 69, 73, 129),
              width: 0.7,
            ),
          ),
          color: BiColors.bnb1e224f,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BiMotion(
              onPressed: () => setState(() => isActive = 0),
              child: isActive == 0
                  ? Container(
                      padding: EdgeInsets.all(13.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(100.r),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff0DA6C2),
                            Color(0xff0E39C6),
                          ],
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/tra_false.svg',
                        width: 23.w,
                        color: Colors.white,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/icons/tra_false.svg',
                      width: 26.w,
                    ),
            ),
            BiMotion(
              onPressed: () => setState(() => isActive = 1),
              child: isActive == 1
                  ? Container(
                      padding: EdgeInsets.all(13.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(100.r),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff0DA6C2),
                            Color(0xff0E39C6),
                          ],
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/stati_false.svg',
                        width: 24.w,
                        color: Colors.white,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/icons/stati_false.svg',
                      width: 26.w,
                    ),
            ),
            BiMotion(
              onPressed: () => setState(() => isActive = 2),
              child: isActive == 2
                  ? Container(
                      padding: EdgeInsets.all(13.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(100.r),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff0DA6C2),
                            Color(0xff0E39C6),
                          ],
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/news_false.svg',
                        width: 24.w,
                        color: Colors.white,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/icons/news_false.svg',
                      width: 26.w,
                    ),
            ),
            BiMotion(
              onPressed: () => setState(() => isActive = 3),
              child: isActive == 3
                  ? Container(
                      padding: EdgeInsets.all(13.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(100.r),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff0DA6C2),
                            Color(0xff0E39C6),
                          ],
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/setting_false.svg',
                        width: 23.w,
                        color: Colors.white,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/icons/setting_false.svg',
                      width: 26.w,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  late int isActive = widget.indexScr;
  final _pages = <Widget>[
    const TradeScreen(),
    const StatisticsScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];
}

class BiBottomBar extends StatefulWidget {
  const BiBottomBar({super.key, this.indexScr = 0});
  final int indexScr;

  @override
  State<BiBottomBar> createState() => BiBottomBarState();
}
