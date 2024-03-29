import 'dart:math';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/statistics/statistics_detail/cha_cub.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PlusCurChartkjbscjdvs extends StatelessWidget {
  const PlusCurChartkjbscjdvs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlusCurCubitIUGBSD, List<FlSpot>>(
      builder: (context, points) {
        return SizedBox(
          height: 400.h,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.white,
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((LineBarSpot touchedSpot) {
                      final cubit = context.read<PlusCurCubitIUGBSD>();
                      final DateTime date = DateTime.now().subtract(
                        Duration(
                          days: (cubit.pointsCount - touchedSpot.x).toInt(),
                        ),
                      );
                      final String dateStr =
                          DateFormat('dd.MM.yyyy').format(date);
                      final String timeStr = DateFormat('HH:mm').format(date);
                      final random = Random();
                      final randomIndex =
                          random.nextInt(cubit.leftTitles.length);
                      final yValue = cubit.leftTitles[randomIndex];
                      return LineTooltipItem(
                        '$dateStr\n$timeStr\n$yValue',
                        const TextStyle(color: Colors.black),
                      );
                    }).toList();
                  },
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (value) => FlLine(
                  strokeWidth: 0.1.w,
                  color: Colors.white.withOpacity(
                    0.2,
                  ),
                ),
              ),
              // ? Левая граница
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(
                    color: BiColors.blue19173D,
                    width: 1,
                  ),
                ),
              ),
              titlesData: FlTitlesData(
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45.h,
                    interval: 4,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      final cubit = context.read<PlusCurCubitIUGBSD>();
                      final interval =
                          cubit.pointsCount / (cubit.bottomTitles.length - 1);
                      final index = (value / interval).round();
                      if (index >= 0 && index < cubit.bottomTitles.length) {
                        return Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            cubit.bottomTitles[index],
                            style: TextStyle(
                              height: 0,
                              fontSize: 14.sp,
                              color: BiColors.blue7B78AA,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40.w,
                    interval: 0.4,
                    getTitlesWidget: (value, meta) {
                      String title = value.toStringAsFixed(0);
                      return Text(
                        '\$$title',
                        style: TextStyle(
                          color: BiColors.blue7B78AA,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
              ),

              lineBarsData: [
                LineChartBarData(
                  spots: points,
                  isCurved: true,
                  color: BiColors.blue0DA6C2,
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      if (index == barData.spots.length - 1) {
                        return FlDotCirclePainter(
                          radius: 0,
                          color: BiColors.blue19173D,
                          strokeWidth: 0,
                          strokeColor: BiColors.blue19173D,
                        );
                      }
                      return FlDotCirclePainter(
                        radius: 5,
                        color: Colors.transparent,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        BiColors.blue0DA6C2,
                        BiColors.blue0DA6C2.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
