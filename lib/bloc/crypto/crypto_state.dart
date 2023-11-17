part of 'crypto_bloc.dart';

final class CryptoState extends Equatable {
  final bool loading;

  const CryptoState({
    this.loading = false,
  });

  CryptoState copyWith({
    bool? loading,
  }) {
    return CryptoState(
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [
        loading,
      ];

  @override
  String toString() {
    return '''CryptoState {
      loading: $loading,
    }''';
  }
}
