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
  }

  void _getCryptos(GetCryptos event, Emitter<CryptoState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await CryptoService().getLatestCrypto();
      if (response != null) {
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on DioException catch (dioError) {
      Fluttertoast.showToast(
          msg: dioError.error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
