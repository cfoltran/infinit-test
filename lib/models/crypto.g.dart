// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoAdapter extends TypeAdapter<Crypto> {
  @override
  final int typeId = 1;

  @override
  Crypto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Crypto(
      id: fields[0] as int,
      name: fields[1] as String,
      symbol: fields[2] as String,
      price: fields[3] as double,
      volumeChange24h: fields[4] as double,
      percentChange24h: fields[5] as double,
      marketCap: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Crypto obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.volumeChange24h)
      ..writeByte(5)
      ..write(obj.percentChange24h)
      ..writeByte(6)
      ..write(obj.marketCap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
