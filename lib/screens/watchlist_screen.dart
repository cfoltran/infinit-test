import 'package:cryptoo/bloc/crypto/crypto_bloc.dart';
import 'package:cryptoo/common/crypto_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (_, state) {
        return ListView.builder(
          itemCount: state.watchlist.length,
          itemBuilder: (_, index) {
            final crypto = state.cryptos
                .firstWhere((c) => c.id == state.watchlist[index].id);
            return Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Expanded(child: CryptoListTile(crypto: crypto)),
                  IconButton(
                    onPressed: () => context
                        .read<CryptoBloc>()
                        .add(RemoveFromWatchList(crypto: crypto)),
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
