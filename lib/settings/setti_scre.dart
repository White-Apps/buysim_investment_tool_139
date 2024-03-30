import 'package:buysim_investment_tool_137/core/urls.dart';
import 'package:buysim_investment_tool_137/core/web_vieww.dart';
import 'package:buysim_investment_tool_137/premium/pre_scr.dart';
import 'package:buysim_investment_tool_137/settings/widget/sett_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 26.h,
              fontWeight: FontWeight.w700,
              color: BiColors.whate,
            ),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 8.w),
        //     child: BiMotion(
        //       onPressed: () {},
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: const Color.fromARGB(255, 25, 29, 71),
        //           borderRadius: BorderRadius.circular(20.r),
        //           border: Border.all(
        //             color: const Color.fromARGB(255, 69, 73, 129),
        //             width: 0.7,
        //           ),
        //         ),
        //         child: Padding(
        //           padding:   EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        //           child: Row(
        //             children: [
        //               Image.asset(
        //                 'assets/icons/wallet_icon.png',
        //                 width: 21.w,
        //               ),
        //               SizedBox(width: 10.w),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     '500 USDT',
        //                     style: TextStyle(
        //                       fontSize: 14.h,
        //                       fontWeight: FontWeight.w500,
        //                       color: BiColors.whate,
        //                       height: 0,
        //                     ),
        //                   ),
        //                   Text(
        //                     'your balance',
        //                     style: TextStyle(
        //                       fontSize: 12.h,
        //                       fontWeight: FontWeight.w500,
        //                       color: BiColors.blue7B78AA,
        //                       height: 0,
        //                     ),
        //                   ),
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Settingsitem(
              width: 24.w,
              iconSet: 'assets/icons/premium_icon.png',
              titleSet: 'Get Premium',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PremiumScreen(
                      isClose: true,
                    ),
                  ),
                );
              },
              isActivColor: true,
            ),
            Settingsitem(
              width: 23.w,
              iconSet: 'assets/icons/1_icon.png',
              titleSet: 'Privacy Policy',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFF(
                      title: 'Privacy Policy',
                      url: DocFF.pP,
                    ),
                  ),
                );
              },
            ),
            Settingsitem(
              width: 20.w,
              iconSet: 'assets/icons/2_icon.png',
              titleSet: 'Terms of Use',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFF(
                      title: 'Terms of Use',
                      url: DocFF.tUse,
                    ),
                  ),
                );
              },
            ),
            Settingsitem(
              width: 24.w,
              iconSet: 'assets/icons/3_icon.png',
              titleSet: 'Support',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFF(
                      title: 'Support',
                      url: DocFF.s,
                    ),
                  ),
                );
              },
            ),
            Settingsitem(
              width: 23.w,
              iconSet: 'assets/icons/4_icon.png',
              titleSet: 'Restore',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
