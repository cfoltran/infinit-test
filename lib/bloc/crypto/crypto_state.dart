part of 'crypto_bloc.dart';

class CryptoState extends Equatable {
  final List<Crypto>? cryptos;
  final bool loading;

  const CryptoState({
    this.cryptos,
    this.loading = false,
  });

  CryptoState copyWith({
    List<Crypto>? cryptos,
    bool? loading,
  }) {
    return CryptoState(
      loading: loading ?? this.loading,
      cryptos: cryptos ?? this.cryptos,
    );
  }

  @override
  List<Object> get props => [
        loading,
        cryptos ?? [],
      ];

  @override
  String toString() {
    return '''CryptoState {
      loading: $loading,
    }''';
  }
}
