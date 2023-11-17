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
  final String slug;

  @HiveField(4)
  final bool isActive;

  @HiveField(5)
  final bool isFiat;

  @HiveField(6)
  final double circulatingSupply;

  @HiveField(7)
  final double totalSupply;

  @HiveField(8)
  final double? maxSupply;

  @HiveField(9)
  final DateTime dateAdded;

  @HiveField(10)
  final int numMarketPairs;

  @HiveField(11)
  final int cmcRank;

  @HiveField(12)
  final DateTime lastUpdated;

  @HiveField(14)
  final dynamic platform;

  @HiveField(15)
  final double? selfReportedCirculatingSupply;

  @HiveField(16)
  final double? selfReportedMarketCap;

  @HiveField(17)
  final double price;

  @HiveField(18)
  final double volumeChange24h;

  @HiveField(19)
  final double percentChange24h;

  @HiveField(20)
  final double marketCap;

  const Crypto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.isActive,
    required this.isFiat,
    required this.circulatingSupply,
    required this.totalSupply,
    this.maxSupply,
    required this.dateAdded,
    required this.numMarketPairs,
    required this.cmcRank,
    required this.lastUpdated,
    this.platform,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    required this.price,
    this.volumeChange24h = 0,
    this.percentChange24h = 0,
    this.marketCap = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        symbol,
        slug,
        isActive,
        isFiat,
        circulatingSupply,
        totalSupply,
        maxSupply,
        dateAdded,
        numMarketPairs,
        cmcRank,
        lastUpdated,
        platform,
        selfReportedCirculatingSupply,
        selfReportedMarketCap,
        price,
        volumeChange24h,
        percentChange24h,
        marketCap,
      ];

  factory Crypto.fromJson(Map<String, dynamic>? json) {
    return Crypto(
      id: json?['id'] as int,
      name: json?['name'] as String,
      symbol: json?['symbol'] as String,
      slug: json?['slug'] as String,
      isActive: json?['is_active'] == 1,
      isFiat: json?['is_fiat'] == 1,
      circulatingSupply: (json?['circulating_supply'] ?? 0).toDouble(),
      totalSupply: (json?['total_supply'] ?? 0).toDouble(),
      maxSupply: (json?['max_supply'] ?? 0).toDouble(),
      dateAdded: DateTime.parse(json?['date_added']),
      numMarketPairs: json?['num_market_pairs'] as int,
      cmcRank: json?['cmc_rank'] as int,
      lastUpdated: DateTime.parse(json?['last_updated']),
      platform: json?['platform'],
      selfReportedCirculatingSupply:
          (json?['self_reported_circulating_supply'] ?? 0).toDouble(),
      selfReportedMarketCap:
          (json?['self_reported_market_cap'] ?? 0).toDouble(),
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
  String toString() {
    return 'Crypto { id: $id, name: $name, symbol: $symbol, slug: $slug, isActive: $isActive, isFiat: $isFiat, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, dateAdded: $dateAdded, numMarketPairs: $numMarketPairs, cmcRank: $cmcRank, lastUpdated: $lastUpdated, platform: $platform, selfReportedCirculatingSupply: $selfReportedCirculatingSupply, selfReportedMarketCap: $selfReportedMarketCap, price: $price, volumeChange24h: $volumeChange24h, percentChange24h: $percentChange24h, marketCap: $marketCap }';
  }
}
