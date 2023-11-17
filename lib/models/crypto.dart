import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'crypto.g.dart';

@HiveType(typeId: 1)
class Crypto extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String symbol;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final double volumeChange24h;

  @HiveField(5)
  final double percentChange24h;

  @HiveField(6)
  final double marketCap;

  const Crypto(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.price,
      this.volumeChange24h = 0,
      this.percentChange24h = 0,
      this.marketCap = 0});

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        price,
      ];

  factory Crypto.fromJson(Map<String, dynamic>? json) {
    return Crypto(
      id: json?['id'] as int,
      name: json?['name'] as String,
      symbol: json?['symbol'] as String,
      price: json?['quote']['USD']['price'] as double,
      volumeChange24h: json?['quote']['USD']['volume_change_24h'] as double,
      percentChange24h: json?['quote']['USD']['percent_change_24h'] as double,
      marketCap: json?['quote']['USD']['market_cap'] as double,
    );
  }

  static List<Crypto> fromList(List<dynamic>? json) {
    return json?.map((e) => Crypto.fromJson(e)).toList() ?? [];
  }

  @override
  String toString() =>
      'Crypto { id: $id, name: $name, symbol: $symbol, price: $price, volumeChange24h: $volumeChange24h, percentChange24h: $percentChange24h, marketCap: $marketCap }';
}
