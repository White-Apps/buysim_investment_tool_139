import 'package:buysim_investment_tool_137/trade/logic/models/trade_model.dart';
import 'package:buysim_investment_tool_137/trade/logic/repositories/trade_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetTradeCubit extends Cubit<GetTradeState> {
  GetTradeCubit(this.repo) : super(const Loading());

  final TradeRepo repo;

  getAllTradeList() async {
    emit(const Loading());
    try {
      final tradeList = await repo.getTrade();
      emit(Success(tradeList));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}

class GetTradeState {
  const GetTradeState();
}

class Loading extends GetTradeState {
  const Loading();
}

class Error extends GetTradeState {
  final String e;
  const Error(this.e);
}

class Success extends GetTradeState {
  final List<TradeHiveModel> model;
  const Success(this.model);
}
