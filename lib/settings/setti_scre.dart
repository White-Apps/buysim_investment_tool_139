import 'package:buysim_investment_tool_137/core/bi_dc.dart';
import 'package:buysim_investment_tool_137/core/web_vieww.dart';
import 'package:buysim_investment_tool_137/premium/pre_scr.dart';
import 'package:buysim_investment_tool_137/settings/buysim_investment_prenvdf.dart';
import 'package:buysim_investment_tool_137/settings/widget/sett_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            FutureBuilder(
                future: getBuysimInvestmentPedf(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && !snapshot.data!) {
                    return Settingsitem(
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
                    );
                  }
                  return const SizedBox();
                }),
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
              onPressed: () {
                restoreBuysimInvestmentPedf(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
