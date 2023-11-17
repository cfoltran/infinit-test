import 'package:cryptoo/models/crypto.dart';
import 'package:cryptoo/services/crypto_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(const CryptoState()) {
    on<GetCryptos>(_getCryptos);
    on<RefreshCryptoDetails>(_refreshCryptoDetails);
  }

  void _getCryptos(GetCryptos event, Emitter<CryptoState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.nextPage) {
        emit(state.copyWith(page: state.page + 1));
      }
      List<Crypto>? cryptos =
          await CryptoService().getLatestCryptos(page: state.page);
      if (cryptos != null) {
        emit(state.copyWith(cryptos: [...state.cryptos ?? [], ...cryptos]));
      }
    } on DioException catch (dioError) {
      _showErrorToast(dioError);
    } catch (e, stackTrace) {
      debugPrint('CryptoBloc _getCryptos $e - $stackTrace');
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void _refreshCryptoDetails(
      RefreshCryptoDetails event, Emitter<CryptoState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      Crypto? crypto = await CryptoService().getCryptoInfos(event.id);
      // if (crypto != null) {
      //   emit(state.copyWith(crypto: crypto));
      // }
    } on DioException catch (dioError) {
      _showErrorToast(dioError);
    } catch (e, stackTrace) {
      debugPrint('CryptoBloc _refreshCryptoDetails $e - $stackTrace');
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void _showErrorToast(DioError dioError) {
    Fluttertoast.showToast(
        msg: dioError.response?.data['status']['error_message'] ??
            dioError.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
