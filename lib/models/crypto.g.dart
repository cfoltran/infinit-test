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
      slug: fields[3] as String,
      isActive: fields[4] as bool,
      isFiat: fields[5] as bool,
      circulatingSupply: fields[6] as double,
      totalSupply: fields[7] as double,
      maxSupply: fields[8] as double?,
      dateAdded: fields[9] as DateTime,
      numMarketPairs: fields[10] as int,
      cmcRank: fields[11] as int,
      lastUpdated: fields[12] as DateTime,
      platform: fields[14] as dynamic,
      selfReportedCirculatingSupply: fields[15] as double?,
      selfReportedMarketCap: fields[16] as double?,
      price: fields[17] as double,
      volumeChange24h: fields[18] as double,
      percentChange24h: fields[19] as double,
      marketCap: fields[20] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Crypto obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.slug)
      ..writeByte(4)
      ..write(obj.isActive)
      ..writeByte(5)
      ..write(obj.isFiat)
      ..writeByte(6)
      ..write(obj.circulatingSupply)
      ..writeByte(7)
      ..write(obj.totalSupply)
      ..writeByte(8)
      ..write(obj.maxSupply)
      ..writeByte(9)
      ..write(obj.dateAdded)
      ..writeByte(10)
      ..write(obj.numMarketPairs)
      ..writeByte(11)
      ..write(obj.cmcRank)
      ..writeByte(12)
      ..write(obj.lastUpdated)
      ..writeByte(14)
      ..write(obj.platform)
      ..writeByte(15)
      ..write(obj.selfReportedCirculatingSupply)
      ..writeByte(16)
      ..write(obj.selfReportedMarketCap)
      ..writeByte(17)
      ..write(obj.price)
      ..writeByte(18)
      ..write(obj.volumeChange24h)
      ..writeByte(19)
      ..write(obj.percentChange24h)
      ..writeByte(20)
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
