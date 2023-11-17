import 'package:cryptoo/bloc/crypto/crypto_bloc.dart';
import 'package:cryptoo/screens/list_screen.dart';
import 'package:cryptoo/screens/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const ListScreen(),
    const WatchListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(builder: (_, state) {
      return Scaffold(
        appBar: _buildAppBar(context, state.page),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye_outlined),
              label: 'Watchlist',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      );
    });
  }

  AppBar _buildAppBar(BuildContext context, int page) {
    return AppBar(
      title: Text(
          _selectedIndex == 0 ? 'List page ${page.toString()}' : 'Watchlist'),
      actions: [
        IconButton(
          onPressed: () => context.read<CryptoBloc>().add(const GetCryptos()),
          icon: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
