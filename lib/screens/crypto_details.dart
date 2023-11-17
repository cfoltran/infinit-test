import 'package:cryptoo/bloc/crypto/crypto_bloc.dart';
import 'package:cryptoo/models/crypto.dart';
import 'package:cryptoo/services/currency_format_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDetails extends StatefulWidget {
  final Crypto crypto;

  const CryptoDetails({Key? key, required this.crypto}) : super(key: key);

  @override
  _CryptoDetailsState createState() => _CryptoDetailsState();
}

class _CryptoDetailsState extends State<CryptoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildCryptoDetails());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(children: [
        Image.network(
          'https://s2.coinmarketcap.com/static/img/coins/64x64/${widget.crypto.id}.png',
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 10),
        Text(widget.crypto.name),
      ]),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_outline),
        )
      ],
    );
  }

  Widget _buildCryptoDetails() {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        final crypto = state.cryptos?.firstWhere(
          (c) => c.id == widget.crypto.id,
          orElse: () => widget.crypto,
        );

        if (crypto == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context
                .read<CryptoBloc>()
                .add(RefreshCryptoDetails(crypto: crypto));
          },
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildDetailItem('Name', crypto.name),
              _buildDetailItem('Symbol', crypto.symbol),
              _buildDetailItem('Slug', crypto.slug),
              _buildDetailItem('Is Fiat', crypto.isFiat ? 'Yes' : 'No'),
              _buildDetailItem(
                  'Circulating Supply', crypto.circulatingSupply.toString()),
              _buildDetailItem('Total Supply', crypto.totalSupply.toString()),
              _buildDetailItem(
                  'Max Supply', crypto.maxSupply?.toString() ?? 'N/A'),
              _buildDetailItem(
                  'Date Added', crypto.dateAdded.toIso8601String()),
              _buildDetailItem(
                  'Market Pairs', crypto.numMarketPairs.toString()),
              _buildDetailItem('CMC Rank', crypto.cmcRank.toString()),
              _buildDetailItem(
                  'Last Updated', crypto.lastUpdated.toIso8601String()),
              _buildDetailItem('Price (USD)',
                  CurrencyFormatService().formatUSD(crypto.price)),
              _buildDetailItem('24h Volume Change',
                  CurrencyFormatService().formatUSD(crypto.volumeChange24h)),
              _buildDetailItem(
                  '24h Percent Change', '${crypto.percentChange24h}%'),
              _buildDetailItem('Market Cap',
                  CurrencyFormatService().formatUSD(crypto.marketCap)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
