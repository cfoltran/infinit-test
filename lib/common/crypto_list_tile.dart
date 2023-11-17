// stateless widget

import 'package:cryptoo/models/crypto.dart';
import 'package:cryptoo/screens/crypto_details.dart';
import 'package:cryptoo/services/currency_format_service.dart';
import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  final Crypto crypto;
  final bool isWatchlist;

  const CryptoListTile({
    Key? key,
    required this.crypto,
    this.isWatchlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CryptoDetails(crypto: crypto),
            ));
      },
      leading: Image.network(
        'https://s2.coinmarketcap.com/static/img/coins/64x64/${crypto.id}.png',
        width: 24,
        height: 24,
      ),
      title: Text(crypto.name),
      subtitle: Text(CurrencyFormatService().formatUSD(crypto.marketCap)),
      trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(CurrencyFormatService().formatUSD(crypto.price)),
        Text(
          '${crypto.percentChange24h.toStringAsFixed(2)}%',
          style: TextStyle(
            color:
                crypto.percentChange24h > 0 ? Colors.green : Colors.redAccent,
          ),
        ),
      ]),
    );
  }
}
