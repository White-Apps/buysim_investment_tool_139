import 'package:buysim_investment_tool_137/trade/logic/models/trade_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class TradeRepo {
  Future<List<TradeHiveModel>> getTrade();
  Future<void> setTrade(TradeHiveModel tradeHiveModel);
}

class TradeRepoImpl implements TradeRepo {
  @override
  Future<List<TradeHiveModel>> getTrade() async {
    final tradeBox = await Hive.openBox<TradeHiveModel>('TradeBox');
    return tradeBox.values.toList();
  }

  @override
  Future<void> setTrade(TradeHiveModel tradeHiveModel) async {
    final tradeBox = await Hive.openBox<TradeHiveModel>('TradeBox');
    await tradeBox.add(tradeHiveModel);
  }
}
