part of 'crypto_bloc.dart';

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

class RefreshCryptoDetails extends CryptoEvent {
  final int id;

  const RefreshCryptoDetails({required this.id});

  @override
  List<Object> get props => [id];
}
