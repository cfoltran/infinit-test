import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(const CryptoState()) {
    on<GetCryptos>(_getCryptos);
  }

  void _getCryptos(GetCryptos event, Emitter<CryptoState> emit) {
    // emit(state.copyWith(status: CryptoStatus.loading));
    try {
      //   final cryptos = await _cryptoRepository.getCryptos();
      //   emit(state.copyWith(cryptos: cryptos, status: CryptoStatus.loaded));
    } on Exception {}
  }
}
