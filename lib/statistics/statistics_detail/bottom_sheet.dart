import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';

Future bottomShet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        height: 700.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20).r,
            topRight: const Radius.circular(20).r,
          ),
          color: const Color.fromARGB(255, 25, 29, 71),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.h, right: 16.h),
          child: Column(
            children: [
              Container(
                width: 55.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(height: 18.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: BiColors.bnb1e224f,
                  borderRadius: BorderRadius.circular(55.r),
                  border: Border.all(
                    color: const Color.fromARGB(255, 54, 58, 113),
                    width: 0.7,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Text(
                    'You had 18% of MSFT actives',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: BiColors.whate.withOpacity(0.87),
                      height: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Divider(
                thickness: 0.8,
                color: const Color.fromARGB(255, 75, 79, 127).withOpacity(0.5),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const BottomSheetItem(
                      time: '28.01.2024 20:30PM',
                      dol: '-50 USDT',
                      isBanc: true,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    required this.time,
    required this.dol,
    this.isBanc = false,
  });
  final String time;
  final String dol;
  final bool isBanc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            isBanc ? const Color(0xffC25F0D) : const Color(0xff0DC271),
            isBanc ? const Color(0xffC60E27) : const Color(0xff0EA7C6),
          ],
        ),
        color: BiColors.bnb1e224f,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color:
              isBanc ? const Color.fromARGB(255, 215, 136, 71) : BiColors.whate,
          width: 0.7,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Row(
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w400,
                color: BiColors.whate.withOpacity(0.87),
                height: 0,
              ),
            ),
            const Spacer(),
            Text(
              dol,
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w700,
                color: BiColors.whate.withOpacity(0.87),
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
