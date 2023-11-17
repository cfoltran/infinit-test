import 'package:cryptoo/models/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../config_dev.dart' as config;

class CryptoService {
  final dio = Dio();

  static final CryptoService _singleton = CryptoService._internal();

  factory CryptoService() {
    return _singleton;
  }

  CryptoService._internal();

  getLatestCrypto() async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(
        '${config.apiBaseUrl}/cryptocurrency/listings/latest',
        options: Options(
          headers: {
            'X-CMC_PRO_API_KEY': config.apiKey,
          },
        ),
      );
      return Crypto.fromList(response.data!['data']);
    } on DioException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      debugPrint('RpApiService getSth $e - $stackTrace');
      rethrow;
    }
  }
}
