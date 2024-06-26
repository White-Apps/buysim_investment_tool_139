import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Timeframe { day, fiveddddd, month, year, threeYears }

extension on Timeframe {
  int get ddddd {
    switch (this) {
      case Timeframe.day:
        return 20;
      case Timeframe.fiveddddd:
        return 17;
      case Timeframe.month:
        return 12;
      case Timeframe.year:
        return 20;
      case Timeframe.threeYears:
        return 22;
      default:
        return 1;
    }
  }
}

class PlusCurCubitIUGBSD extends Cubit<List<FlSpot>> {
  List<String> leftTitles = [];
  List<String> bottomTitles = [];

  int pointsCount = 0;

  PlusCurCubitIUGBSD() : super([]) {
    kmvskmdvsdvsdv(Timeframe.day);
  }

  void lknvsvsvsdvs() {
    leftTitles = ['102.0', '102.5', '103.0', '103.5', '104.0'];
  }

  void oihjfnvewvwvvrev(Timeframe timeframe) {
    switch (timeframe) {
      case Timeframe.day:
        bottomTitles = [
          '8.00\nam',
          '9.00\nam',
          '10.00\nam',
          '11.00\npm',
          '12.00\npm',
          '13.00\npm',
        ];
        break;
      case Timeframe.fiveddddd:
        bottomTitles = [
          'Mon',
          'Tue',
          'Wed',
          'Thu',
          'Fri',
        ];
        break;
      case Timeframe.month:
        bottomTitles = [
          '1 Week',
          '2 Week',
          '3 Week',
          '4 Week',
        ];
        break;
      case Timeframe.year:
        bottomTitles = [
          'Feb 23',
          'Mar 23',
          'Apr 23',
          'May 23',
          'Jun 23',
          'Jul 23'
        ];
        break;
      case Timeframe.threeYears:
        bottomTitles = [
          'Jul 21',
          'Jan 22',
          'Jul 22',
          'Jan 23',
          'Jul 23',
        ];
        break;
      default:
        bottomTitles = [];
        break;
    }
  }

  void kmvskmdvsdvsdv(Timeframe timeframe) {
    final int ddddd = timeframe.ddddd;
    pointsCount = ddddd;
    // updateLeftTitles(ddddd);
    lknvsvsvsdvs();
    oihjfnvewvwvvrev(timeframe);

    final List<FlSpot> makncsava = List.generate(ddddd, (index) {
      double manavasvav =
          100.0 + Random().nextDouble() * 2.0; // ? 2.0 = 104.0 - 102.0
      return FlSpot(index.toDouble(), manavasvav);
    });

    emit(makncsava);
  }

  void updateChartDataidnjsdsd(CurentModel currency) async {
    final random = Random();
    List<FlSpot> apishvoancvj = List.generate(10, (index) {
      final double xxsvjsds = index.toDouble();
      final double yyysdv = random.nextDouble() * 10;
      return FlSpot(xxsvjsds, yyysdv);
    });

    emit(apishvoancvj);
  }
}

class CurentModel {
  final String icon;
  final String title;
  bool isLike;

  CurentModel({
    required this.icon,
    required this.title,
    this.isLike = false,
  });
}
