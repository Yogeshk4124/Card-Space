// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class cardAdapter extends TypeAdapter<card> {
  @override
  final int typeId = 9;

  @override
  card read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return card(
      bgType: fields[0] as int,
      solid: fields[10] as String,
      gradient: (fields[11] as List)?.cast<String>(),
      path: fields[12] as String,
      cardNetworkType: fields[1] as String,
      company: fields[2] as String,
      cardHolderName: fields[3] as String,
      cardNumber: fields[4] as String,
      validityFromMonth: fields[7] as int,
      validityFromYear: fields[8] as int,
      validityToMonth: fields[5] as int,
      validityToYear: fields[6] as int,
      cvvCode: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, card obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.bgType)
      ..writeByte(1)
      ..write(obj.cardNetworkType)
      ..writeByte(2)
      ..write(obj.company)
      ..writeByte(3)
      ..write(obj.cardHolderName)
      ..writeByte(4)
      ..write(obj.cardNumber)
      ..writeByte(5)
      ..write(obj.validityToMonth)
      ..writeByte(6)
      ..write(obj.validityToYear)
      ..writeByte(7)
      ..write(obj.validityFromMonth)
      ..writeByte(8)
      ..write(obj.validityFromYear)
      ..writeByte(9)
      ..write(obj.cvvCode)
      ..writeByte(10)
      ..write(obj.solid)
      ..writeByte(11)
      ..write(obj.gradient)
      ..writeByte(12)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is cardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
