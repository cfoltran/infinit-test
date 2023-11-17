part of 'crypto_bloc.dart';

class Init extends CryptoEvent {
  const Init();
}

class CryptoEvent extends Equatable {
  const CryptoEvent();

  @override
  List<Object> get props => [];
}

class GetCryptos extends CryptoEvent {
  final bool nextPage;

  const GetCryptos({this.nextPage = false});

  @override
  List<Object> get props => [nextPage];
}

class RefreshCryptos extends CryptoEvent {
  const RefreshCryptos();
}

class RefreshCryptoDetails extends CryptoEvent {
  final Crypto crypto;

  const RefreshCryptoDetails({required this.crypto});

  @override
  List<Object> get props => [crypto];
}

class AddToWatchList extends CryptoEvent {
  final Crypto crypto;

  const AddToWatchList({required this.crypto});

  @override
  List<Object> get props => [crypto];
}
