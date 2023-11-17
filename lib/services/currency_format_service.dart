import 'package:intl/intl.dart';

class CurrencyFormatService {
  static final CurrencyFormatService _singleton =
      CurrencyFormatService._internal();

  CurrencyFormatService._internal();

  factory CurrencyFormatService() {
    return _singleton;
  }

  String formatUSD(double value) {
    final formatter = NumberFormat('#,##0.00', 'en_US');
    final result = formatter.format(value);
    return '$result\$';
  }

  String formatCryptoCurrency(double value, String symbol) {
    final formatter = NumberFormat('#,##0.00###', 'en_US');
    final result = formatter.format(value);
    return '$result $symbol';
  }
}
