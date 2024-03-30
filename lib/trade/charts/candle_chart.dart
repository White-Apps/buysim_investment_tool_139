import 'dart:async';
import 'dart:math';

import 'package:buysim_investment_tool_137/trade/cubit/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleChart extends StatefulWidget {
  final String selectedTime;
  final Stream<bool> buySignalStream;
  final double selectedAmount;

  const CandleChart({
    super.key,
    required this.selectedTime,
    required this.buySignalStream,
    required this.selectedAmount,
  });

  @override
  State<CandleChart> createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  late List<ChartData> _chartData;
  late ChartSeriesController _chartSeriesController;
  late StreamSubscription<bool> _buySignalSubscription;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _chartData = getInitialChartData();
    _timer = Timer.periodic(Duration(seconds: 1), _updateDataSource);
    context.read<CurrencyPairCubit>().stream.listen((_) {
      _refreshChartData();
    });
    _buySignalSubscription = widget.buySignalStream.listen((signal) {
      _addNewCandle(signal);
    });
  }

  void _refreshChartData() {
    setState(() {
      _chartData.clear();
      _chartData = getInitialChartData();
      _chartSeriesController.updateDataSource(
        addedDataIndex: _chartData.length - 1,
        removedDataIndex: 0,
      );
    });
  }
  // @override
  // void initState() {
  //   _chartData = getInitialChartData();
  //   _timer = Timer.periodic(const Duration(seconds: 1), _updateDataSource);
  //   context.read<CurrencyPairCubit>().stream.listen((_) {
  //     _refreshChartData();
  //   });
  //   super.initState();
  //   _buySignalSubscription = widget.buySignalStream.listen((_) {
  //     DateTime currentTime = DateTime.now();
  //     double randomValue =
  //         Random().nextDouble() * (0.91785 - 0.91755) + 0.91755;
  //     Color randomColor = Random().nextBool() ? BiColors.red : BiColors.green;
  //     ChartData newPoint =
  //         ChartData(currentTime, randomValue, randomColor, true);
  //     setState(
  //       () {
  //         if (randomColor == BiColors.green) {
  //           // Если цвет зеленый, удваиваем баланс
  //           double currentBalance = UserPreferences.getBalance();
  //           UserPreferences.setBalance(
  //             currentBalance + (widget.selectedAmount * 2),
  //           );
  //           UserPreferences.setBalance(
  //                   currentBalance + (widget.selectedAmount * 2))
  //               .then((_) {
  //             BlocProvider.of<BalanceCubit>(context)
  //                 .updateBalance(currentBalance + (widget.selectedAmount * 2));
  //           });
  //         } else {}
  //         _chartData.add(newPoint);
  //         _chartSeriesController.updateDataSource(
  //           addedDataIndex: _chartData.length - 1,
  //         );
  //       },
  //     );
  //   });
  // }

  @override
  void dispose() {
    _timer?.cancel();
    _buySignalSubscription.cancel();
    super.dispose();
  }

  List<ChartData> getInitialChartData() {
    List<ChartData> chartData = [];
    DateTime now = DateTime.now();
    for (int i = 0; i < 20; i++) {
      final open = Random().nextDouble() * (0.91785 - 0.91755) + 0.91755;
      final close = Random().nextDouble() * (0.91785 - 0.91755) + 0.91755;
      final high = max(open, close) + Random().nextDouble() * 0.0001;
      final low = min(open, close) - Random().nextDouble() * 0.0001;
      chartData.add(ChartData(
          now.subtract(Duration(minutes: i)), open, high, low, close, 1000));
    }
    return chartData.reversed.toList();
  }

  void _updateDataSource(Timer timer) {
    final DateTime now = DateTime.now();
    final double open = Random().nextDouble() * (0.91785 - 0.91755) + 0.91755;
    final double close = Random().nextDouble() * (0.91785 - 0.91755) + 0.91755;
    final double high = max(open, close) + Random().nextDouble() * 0.0001;
    final double low = min(open, close) - Random().nextDouble() * 0.0001;
    final ChartData newCandle = ChartData(now, open, high, low, close, 1000);

    setState(() {
      _chartData.add(newCandle);
      _chartSeriesController.updateDataSource(
        addedDataIndexes: [_chartData.length - 1],
      );
      if (_chartData.length > 20) {
        _chartData.removeAt(0);
        _chartSeriesController.updateDataSource(
          removedDataIndexes: [0],
        );
      }
    });
  }

  void _addNewCandle(bool signal) {
    final DateTime now = DateTime.now();
    final double open = Random().nextDouble() * (0.91785 - 0.91755) + 0.91755;
    final double close = Random().nextDouble() * (0.91785 - 0.91755) + 0.91755;
    final double high = max(open, close) + Random().nextDouble() * 0.0001;
    final double low = min(open, close) - Random().nextDouble() * 0.0001;
    final ChartData newCandle = ChartData(now, open, high, low, close, 1000);

    setState(() {
      _chartData.add(newCandle);
      _chartSeriesController.updateDataSource(
        addedDataIndexes: [_chartData.length - 1],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: <ChartSeries>[
        CandleSeries<ChartData, DateTime>(
          dataSource: _chartData,
          xValueMapper: (ChartData data, _) => data.time,
          lowValueMapper: (ChartData data, _) => data.low,
          highValueMapper: (ChartData data, _) => data.high,
          openValueMapper: (ChartData data, _) => data.open,
          closeValueMapper: (ChartData data, _) => data.close,
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
        ),
      ],
      primaryXAxis: DateTimeAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        dateFormat: DateFormat.Hm(),
        intervalType: DateTimeIntervalType.minutes,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
      ),
    );
  }
}

class ChartData {
  final DateTime time;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;

  ChartData(this.time, this.open, this.high, this.low, this.close, this.volume);
}
