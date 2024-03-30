import 'dart:async';
import 'dart:math';
import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/trade/cubit/balance_cubit.dart';
import 'package:buysim_investment_tool_137/trade/cubit/currency_cubit.dart';
import 'package:buysim_investment_tool_137/trade/widget/methos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LinearChartWidget extends StatefulWidget {
  final String selectedTime;
  final Stream<bool> buySignalStream;
  final double selectedAmount;

  const LinearChartWidget(
      {super.key,
      required this.selectedTime,
      required this.buySignalStream,
      required this.selectedAmount});

  @override
  State<LinearChartWidget> createState() => _LinearChartWidgetState();
}

class _LinearChartWidgetState extends State<LinearChartWidget> {
  late List<ChartData> _chartData;
  late ChartSeriesController _chartSeriesController;
  late StreamSubscription<bool> _buySignalSubscription;
  Timer? _timer;

  @override
  void initState() {
    _chartData = getChartData();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateDataSource);
    context.read<CurrencyPairCubit>().stream.listen((_) {
      _refreshChartData();
    });
    super.initState();
    _buySignalSubscription = widget.buySignalStream.listen((_) {
      DateTime currentTime = DateTime.now();
      double randomValue =
          Random().nextDouble() * (0.91785 - 0.91755) + 0.91755;
      Color randomColor = Random().nextBool() ? BiColors.red : BiColors.green;
      ChartData newPoint =
          ChartData(currentTime, randomValue, randomColor, true);

      setState(
        () {
          if (randomColor == BiColors.green) {
            // Если цвет зеленый, удваиваем баланс
            double currentBalance = UserPreferences.getBalance();
            UserPreferences.setBalance(
              currentBalance + (widget.selectedAmount * 2),
            );
            UserPreferences.setBalance(
                    currentBalance + (widget.selectedAmount * 2))
                .then((_) {
              BlocProvider.of<BalanceCubit>(context)
                  .updateBalance(currentBalance + (widget.selectedAmount * 2));
            });
          } else {
          }
          _chartData.add(newPoint);
          _chartSeriesController.updateDataSource(
            addedDataIndex: _chartData.length - 1,
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _buySignalSubscription.cancel();
    super.dispose();
  }

  void _refreshChartData() {
    setState(() {
      _chartData.clear();
      _chartData
          .addAll(getRandomChartData()); 
      _chartSeriesController.updateDataSource(
        addedDataIndex: _chartData.length - 1,
        removedDataIndex: 0,
      );
    });
  }

  List<ChartData> getRandomChartData() {
    final List<ChartData> chartData = [];
    final DateTime now = DateTime.now();
    for (int i = 0; i < 20; i++) {
      chartData.add(
        ChartData(
            now.subtract(Duration(minutes: i)),
            Random().nextDouble() * (0.91785 - 0.91755) + 0.91755,
            BiColors.green),
      );
    }
    return chartData.reversed.toList();
  }

  void _updateDataSource(Timer timer) {
    setState(() {
      _chartData.add(
        ChartData(
          DateTime.now(),
          Random().nextDouble() * (0.91785 - 0.91755) + 0.91755,
          const Color(0xFFFAFF00),
        ),
      );

      _chartData.removeAt(0);
      _chartSeriesController.updateDataSource(
        addedDataIndex: _chartData.length - 1,
        removedDataIndex: 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.transparent,
      primaryXAxis: DateTimeAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        dateFormat: DateFormat.Hm(),
        intervalType: DateTimeIntervalType.minutes,
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
        labelStyle: const TextStyle(color: Colors.white),
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}',
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.white),
      ),
      series: <ChartSeries>[
        LineSeries<ChartData, DateTime>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          dataSource: _chartData,
          xValueMapper: (ChartData data, _) => data.time,
          yValueMapper: (ChartData data, _) => data.value,
          pointColorMapper: (ChartData data, _) => data.color,
          markerSettings: const MarkerSettings(
            isVisible: true,
            height: 6,
            width: 6,
          ),
          color: BiColors.red,
        ),
        LineSeries<ChartData, DateTime>(
          dataSource: _chartData.where((data) => data.isHighlighted).toList(),
          xValueMapper: (ChartData data, _) => data.time,
          yValueMapper: (ChartData data, _) => data.value,
          markerSettings: MarkerSettings(
            isVisible: true,
            height: 10.h,
            width: 10.w,
            color: BiColors.whate,
            shape: DataMarkerType.circle,
          ),
          color: Colors.transparent,
        ),
      ],
    );
  }

  List<ChartData> getChartData() {
    final List<ChartData> chartData = [];
    final DateTime now = DateTime.now();
    for (int i = 0; i < 20; i++) {
      chartData.add(
        ChartData(
            now.subtract(Duration(minutes: i)),
            Random().nextDouble() * (0.91785 - 0.91755) + 0.91755,
            BiColors.green),
      );
    }
    return chartData.reversed.toList();
  }
}

class ChartData {
  ChartData(this.time, this.value, this.color, [this.isHighlighted = false]);

  final DateTime time;
  final double value;
  final Color color;
  final bool isHighlighted;
}
