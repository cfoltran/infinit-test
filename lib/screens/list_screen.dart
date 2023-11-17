import 'package:cryptoo/bloc/crypto/crypto_bloc.dart';
import 'package:cryptoo/common/crypto_list_tile.dart';
import 'package:cryptoo/screens/crypto_details.dart';
import 'package:cryptoo/services/currency_format_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !context.read<CryptoBloc>().state.loading) {
      context.read<CryptoBloc>().add(const GetCryptos(nextPage: true));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(builder: (context, state) {
      if (state.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return RefreshIndicator(
          onRefresh: () async {
            context.read<CryptoBloc>().add(const RefreshCryptos());
            await context
                .read<CryptoBloc>()
                .stream
                .firstWhere((state) => !state.loading);
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: state.cryptos.length,
            itemBuilder: (context, index) {
              final crypto = state.cryptos[index];
              return CryptoListTile(crypto: crypto);
            },
          ));
    });
  }
}
