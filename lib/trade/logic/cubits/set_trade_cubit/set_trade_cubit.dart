import 'package:buysim_investment_tool_137/trade/logic/models/trade_model.dart';
import 'package:buysim_investment_tool_137/trade/logic/repositories/trade_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetTradeCubit extends Cubit<SetTradeState> {
  SetTradeCubit(this.repo) : super(const Initial());

  final TradeRepo repo;

  setTrade(TradeHiveModel tradeHiveModel) async {
    emit(const Loading());
    try {
      await repo.setTrade(tradeHiveModel);
      emit(const Success());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}

class SetTradeState {
  const SetTradeState();
  bool get isLoading => false;
}

class Initial extends SetTradeState {
  const Initial();
}

class Loading extends SetTradeState {
  const Loading();
  @override
  bool get isLoading => true;
}

class Error extends SetTradeState {
  final String e;
  const Error(this.e);
}

class Success extends SetTradeState {
  const Success();
}
