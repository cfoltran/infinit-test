part of 'crypto_bloc.dart';

class CryptoState extends Equatable {
  final List<Crypto> cryptos;
  final List<Crypto> watchlist;
  final bool loading;
  final int page;

  const CryptoState(
      {this.cryptos = const [],
      this.loading = false,
      this.page = 1,
      this.watchlist = const []});

  CryptoState copyWith({
    List<Crypto>? cryptos,
    List<Crypto>? watchlist,
    bool? loading,
    int? page,
  }) {
    return CryptoState(
      loading: loading ?? this.loading,
      cryptos: cryptos ?? this.cryptos,
      watchlist: watchlist ?? this.watchlist,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        loading,
        cryptos,
        watchlist,
        page,
      ];

  @override
  String toString() {
    return '''CryptoState {
      loading: $loading,
      cryptos: ${page.toString()},
    }''';
  }
}
