part of 'crypto_bloc.dart';

sealed class CryptoEvent extends Equatable {
  const CryptoEvent();

  @override
  List<Object> get props => [];
}

class GetCryptos extends CryptoEvent {
  const GetCryptos();
}