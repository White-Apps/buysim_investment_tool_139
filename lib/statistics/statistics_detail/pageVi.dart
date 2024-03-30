import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/cha_cub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlusCurTogglePOJcamcasasd extends StatefulWidget {
  final void Function(Timeframe) onTimeframeSelected;
  const PlusCurTogglePOJcamcasasd({
    super.key,
    required this.onTimeframeSelected,
  });

  @override
  State<PlusCurTogglePOJcamcasasd> createState() =>
      _PlusCurTogglePOJcamcasasdState();
}

class _PlusCurTogglePOJcamcasasdState extends State<PlusCurTogglePOJcamcasasd> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> timeframes = ['1d', '5d', '1m', '1y', '5y'];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: BiColors.blue262450,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(timeframes.length, (index) {
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () async {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTimeframeSelected(Timeframe.values[index]);
            },
            child: AnimatedContainer(
              width: 66.w,
              height: 50.h,
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: isSelected
                    ? Border.all(
                        color: Colors.white.withOpacity(0.60),
                        width: 0.7,
                      )
                    : null,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff0DA6C2),
                    Color(0xff0E39C6),
                  ],
                ),
                color: isSelected ? BiColors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Text(
                timeframes[index],
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : BiColors.blue7B78AA,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
