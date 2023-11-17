import 'package:cryptoo/bloc/crypto/crypto_bloc.dart';
import 'package:cryptoo/common/crypto_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  _WatchListScreenState createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (_, state) {
        return ListView.builder(
          itemCount: state.watchlist.length,
          itemBuilder: (_, index) {
            final crypto = state.watchlist[index];
            return CryptoListTile(crypto: crypto);
          },
        );
      },
    );
  }
}
