enum ChartType { linear, candlestick }

class ChartState {
  final ChartType type;
  const ChartState({required this.type});

  factory ChartState.linear() => const ChartState(type: ChartType.linear);
  factory ChartState.candlestick() =>
      const ChartState(type: ChartType.candlestick);

  bool get isLinear => type == ChartType.linear;
  bool get isCandlestick => type == ChartType.candlestick;
}
