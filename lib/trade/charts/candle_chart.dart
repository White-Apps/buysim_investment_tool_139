import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleChart extends StatefulWidget {
  const CandleChart({super.key});

  @override
  State<CandleChart> createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  Timer? _timer;
  List<CandleData> _candleData = [];

  @override
  void initState() {
    super.initState();
    _candleData = getCandleData();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _candleData.add(getRandomCandleData());
        if (_candleData.length > 20) {
          _candleData.removeAt(0);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: <CandleSeries>[
        CandleSeries<CandleData, DateTime>(
          dataSource: _candleData,
          xValueMapper: (CandleData data, _) => data.time,
          lowValueMapper: (CandleData data, _) => data.low,
          highValueMapper: (CandleData data, _) => data.high,
          openValueMapper: (CandleData data, _) => data.open,
          closeValueMapper: (CandleData data, _) => data.close,
        ),
      ],
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat.Hm(),
        intervalType: DateTimeIntervalType.minutes,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat.simpleCurrency(decimalDigits: 5),
        interval: 0.0001,
      ),
    );
  }

  List<CandleData> getCandleData() {
    final List<CandleData> data = [];
    for (int i = 0; i < 20; i++) {
      data.add(getRandomCandleData());
    }
    return data;
  }

  CandleData getRandomCandleData() {
    final DateTime now = DateTime.now();
    final Random random = Random();
    final double open = random.nextDouble() * (0.91785 - 0.91755) + 0.91755;
    final double close = random.nextDouble() * (0.91785 - 0.91755) + 0.91755;
    final double high = max(open, close) + random.nextDouble() * 0.0001;
    final double low = min(open, close) - random.nextDouble() * 0.0001;
    return CandleData(
        time: now, open: open, high: high, low: low, close: close);
  }
}

class CandleData {
  CandleData({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  final DateTime time;
  final double open;
  final double high;
  final double low;
  final double close;
}
