import 'package:dio/dio.dart';
import '../../config_dev.dart' as config;

class CryptoService {
  final dio = Dio();

  // @todo typing
  dynamic request() async {
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
