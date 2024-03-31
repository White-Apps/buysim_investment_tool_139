// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TradeHiveModelAdapter extends TypeAdapter<TradeHiveModel> {
  @override
  final int typeId = 0;

  @override
  TradeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TradeHiveModel(
      id: fields[0] as int,
      sum: fields[1] as double,
      chek: fields[2] as bool,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TradeHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sum)
      ..writeByte(2)
      ..write(obj.chek)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TradeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
