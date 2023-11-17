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

  getLatestCryptos({page = 1, limit = 20, id}) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(
        '${config.apiBaseUrl}/v1/cryptocurrency/listings/latest',
        queryParameters: {
          'start': (page - 1) * limit + 1,
          'limit': limit,
        },
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
      debugPrint('getLatestCryptos $e - $stackTrace');
      rethrow;
    }
  }

  getCryptoInfos(int id) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(
        '${config.apiBaseUrl}/v2/cryptocurrency/quotes/latest',
        queryParameters: {
          'id': id,
        },
        options: Options(
          headers: {
            'X-CMC_PRO_API_KEY': config.apiKey,
          },
        ),
      );
      return Crypto.fromJson(response.data!['data'][id.toString()]);
    } on DioException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      debugPrint('getCryptoInfos $e - $stackTrace');
      rethrow;
    }
  }
}
