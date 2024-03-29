import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPairCubit extends Cubit<String> {
  CurrencyPairCubit() : super('EUR/USD');

  void changeCurrencyPair(String newPair) {
    emit(newPair);
  }
}
