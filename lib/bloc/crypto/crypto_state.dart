part of 'crypto_bloc.dart';

class CryptoState extends Equatable {
  final List<Crypto>? cryptos;
  final bool loading;
  final int page;

  const CryptoState({this.cryptos, this.loading = false, this.page = 1});

  CryptoState copyWith({
    List<Crypto>? cryptos,
    bool? loading,
    int? page,
  }) {
    return CryptoState(
      loading: loading ?? this.loading,
      cryptos: cryptos ?? this.cryptos,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        loading,
        cryptos ?? [],
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
