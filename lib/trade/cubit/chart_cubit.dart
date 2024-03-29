import 'package:buysim_investment_tool_137/trade/cubit/chart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit() : super(ChartState.linear());

  void toggleChart(ChartType type) {
    emit(ChartState(type: type));
  }
  
}
