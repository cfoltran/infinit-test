import 'package:cryptoo/bloc/crypto/crypto_bloc.dart';
import 'package:cryptoo/models/crypto.dart';
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
    return BlocProvider(
        create: (context) => CryptoBloc(),
        child: Scaffold(appBar: _buildAppBar(), body: _buildCryptoDetails()));
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
        return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<CryptoBloc>()
                  .add(RefreshCryptoDetails(id: widget.crypto.id));
            },
            child: ListView(
              children: [
                Text(''),
              ],
            ));
      },
    );
  }
}
