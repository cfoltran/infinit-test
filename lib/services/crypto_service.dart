import 'package:dio/dio.dart';
import '../../config_dev.dart' as config;

class CryptoService {
  final dio = Dio();

  static final CryptoService _singleton = CryptoService._internal();

  factory CryptoService() {
    return _singleton;
  }

  CryptoService._internal();
  dynamic getLatestCrypto() async {
    return await dio.get(
      '${config.apiBaseUrl}/cryptocurrency/listings/latest',
      options: Options(
        headers: {
          'X-CMC_PRO_API_KEY': config.apiKey,
        },
      ),
    );
  }
}
