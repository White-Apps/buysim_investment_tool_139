import 'package:hive_flutter/hive_flutter.dart';

part 'trade_model.g.dart';

@HiveType(typeId: 0)
class TradeHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  double sum;
  @HiveField(2)
  bool chek;
  @HiveField(3)
  DateTime date;

  TradeHiveModel({
    required this.id,
    required this.sum,
    required this.chek,
    required this.date,
  });
}
