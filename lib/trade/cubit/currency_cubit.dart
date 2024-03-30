import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPairCubit extends Cubit<String> {
  CurrencyPairCubit() : super('MSFT');

  void changeCurrencyPair(String newPair) {
    emit(newPair);
  }
}
