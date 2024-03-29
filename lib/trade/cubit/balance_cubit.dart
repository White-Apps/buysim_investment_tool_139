import 'package:buysim_investment_tool_137/trade/widget/methos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceCubit extends Cubit<double> {
  BalanceCubit() : super(UserPreferences.getBalance());

  void updateBalance(double newBalance) {
    emit(newBalance);
  }
}
