import 'package:cryptoo/models/crypto.dart';
import 'package:cryptoo/services/crypto_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(const CryptoState()) {
    on<GetCryptos>(_getCryptos);
    on<RefreshCryptos>(_refreshCryptos);
    on<RefreshCryptoDetails>(_refreshCryptoDetails);
    on<AddToWatchList>(_addToWatchList);
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

  void _refreshCryptos(RefreshCryptos event, Emitter<CryptoState> emit) {
    emit(state.copyWith(cryptos: [], page: 1));
    add(const GetCryptos());
  }

  void _refreshCryptoDetails(
      RefreshCryptoDetails event, Emitter<CryptoState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      Crypto? crypto = await CryptoService().getCryptoInfos(event.crypto.id);
      if (crypto != null) {
        List<Crypto> cryptos = state.cryptos ?? [];
        int index = cryptos.indexWhere((element) => element.id == crypto.id);

        if (index != -1) {
          cryptos[index] = crypto;
          emit(state.copyWith(cryptos: cryptos));
        }
      }
    } on DioException catch (dioError) {
      _showErrorToast(dioError);
    } catch (e, stackTrace) {
      debugPrint('CryptoBloc _refreshCryptoDetails $e - $stackTrace');
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void _addToWatchList(AddToWatchList event, Emitter<CryptoState> emit) async {
    try {
      Box<Crypto> watchlist = await Hive.openBox<Crypto>('watchlist');
      if (watchlist.containsKey(event.crypto.id)) {
        watchlist.delete(event.crypto.id);
      } else {
        watchlist.put(event.crypto.id, event.crypto);
      }
      emit(state.copyWith(watchlist: watchlist.values.toList()));
    } catch (e, stackTrace) {
      debugPrint('CryptoBloc _addToWatchList $e - $stackTrace');
    }
  }

  void _showErrorToast(DioException dioError) {
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
