// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 1;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModel(
      transactionData: fields[0] as String,
      sum: fields[1] as String,
      commission: fields[2] as String,
      total: fields[3] as String,
      transactionsNumber: fields[4] as String,
      operationType: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.transactionData)
      ..writeByte(1)
      ..write(obj.sum)
      ..writeByte(2)
      ..write(obj.commission)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.transactionsNumber)
      ..writeByte(5)
      ..write(obj.operationType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
