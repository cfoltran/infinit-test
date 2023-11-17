import 'package:cryptoo/bloc/crypto/crypto_bloc.dart';
import 'package:cryptoo/services/currency_format_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(builder: (context, state) {
      if (state.loading && state.cryptos == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        itemCount: state.cryptos?.length,
        itemBuilder: (context, index) {
          final crypto = state.cryptos![index];
          return ListTile(
            leading: Image.network(
              'https://s2.coinmarketcap.com/static/img/coins/64x64/${crypto.id}.png',
              width: 24,
              height: 24,
            ),
            title: Text(crypto.name),
            subtitle: Text(CurrencyFormatService().formatUSD(crypto.marketCap)),
            trailing:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(CurrencyFormatService().formatUSD(crypto.price)),
              Text(
                '${crypto.percentChange24h.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: crypto.percentChange24h > 0
                      ? Colors.green
                      : Colors.redAccent,
                ),
              ),
            ]),
          );
        },
      );
    });
  }
}
