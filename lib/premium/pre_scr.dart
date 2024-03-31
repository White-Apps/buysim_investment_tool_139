// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:apphud/apphud.dart';
import 'package:buysim_investment_tool_137/main.dart';
import 'package:buysim_investment_tool_137/premium/widget/prem_it_wid.dart';
import 'package:buysim_investment_tool_137/settings/buysim_investment_prenvdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/core/con_bar.dart';
import 'package:buysim_investment_tool_137/core/bi_dc.dart';
import 'package:buysim_investment_tool_137/core/web_vieww.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, this.isClose = false});
  final bool isClose;
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool iiiwev = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (widget.isClose) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BiBottomBar(
                              indexScr: 0,
                            ),
                          ),
                          (protected) => false,
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/icons/close.png',
                      width: 19.w,
                      color: BiColors.whate.withOpacity(0.5),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      restoreBuysimInvestmentPedf(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/refresh_icon.png',
                          width: 20.w,
                          color: BiColors.whate.withOpacity(0.5),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Restore Purchases',
                          style: TextStyle(
                            fontSize: 16.h,
                            height: 0,
                            color: BiColors.whate.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35.h),
            Center(
              child: Image.asset(
                'assets/images/premium.png',
                width: 270.w,
                height: 270.h,
              ),
            ),
            SizedBox(height: 35.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Text(
                    'Get Premium',
                    style: TextStyle(
                      color: BiColors.whate,
                      fontSize: 28.h,
                      height: 0,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PremiItem(
                    iconPre: 'assets/icons/lock.png',
                    titlePre: 'Unlock tests in news section',
                  ),
                  SizedBox(height: 16.h),
                  const PremiItem(
                    iconPre: 'assets/icons/wallet_icon.png',
                    titlePre: 'Get bonus 100 usdt per day',
                  ),
                  SizedBox(height: 16.h),
                  const PremiItem(
                    iconPre: 'assets/icons/no_ad.png',
                    titlePre: 'No ADs',
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: BiMotion(
                onPressed: () async {
                  setState(() {
                    iiiwev = true;
                  });
                  final apphudPaywalls = await Apphud.paywalls();
                  // print(apphudPaywalls?.paywalls.first.products?.first);
                  await Apphud.purchase(
                    product: apphudPaywalls?.paywalls.first.products?.first,
                  ).whenComplete(
                    () async {
                      if (await Apphud.hasPremiumAccess() ||
                          await Apphud.hasActiveSubscription()) {
                        await setBuysimInvestmentPedf();
                        await serPremBool(true);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BiBottomBar(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  );
                  setState(() {
                    iiiwev = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: BiColors.whate.withOpacity(0.6),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff0DA6C2),
                        Color(0xff0E39C6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                    ),
                    child: Center(
                      child: iiiwev
                          ? const CupertinoActivityIndicator(
                              color: Colors.white)
                          : Text(
                              'Buy Premium \$0.99',
                              style: TextStyle(
                                color: BiColors.whate,
                                fontSize: 15.h,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            InkWell(
              onTap: () {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/Privacy_icon.png',
                    width: 22.w,
                    height: 22.h,
                    color: BiColors.whate.withOpacity(0.5),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      height: 0,
                      color: BiColors.whate.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/Terms_icon.png',
                    width: 22.w,
                    height: 19.5.h,
                    color: BiColors.whate.withOpacity(0.5),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Terms of Use',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      height: 0,
                      color: BiColors.whate.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
