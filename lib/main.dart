import 'package:cryptoo/bloc/crypto/crypto_bloc.dart';
import 'package:cryptoo/bottom_nav.dart';
import 'package:cryptoo/models/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CryptoAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CryptoBloc()..add(const GetCryptos()),
          )
        ],
        child: MaterialApp(
          title: 'Cryptwatch',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          home: const BottomNavigation(),
        ));
  }
}
