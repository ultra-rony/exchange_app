import 'package:auto_route/annotations.dart';
import 'package:exchange_app/core/di/injectable.dart';
import 'package:exchange_app/src/domain/usecases/get_stored_cryptocurrencies_use_case.dart';
import 'package:exchange_app/src/domain/usecases/add_stored_cryptocurrency_use_case.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    _test();
    super.initState();
  }

  _test() async {
    final GetStoredCryptocurrenciesUseCase getStoredCryptocurrenciesUseCase = getIt();
    final resp = await getStoredCryptocurrenciesUseCase();
    print("dsadsa ${resp[0]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final AddStoredCryptocurrencyUseCase insertStoredCryptocurrencyUseCase = getIt();
            insertStoredCryptocurrencyUseCase(params: {
              "id": "bitcoin",
              "rank": "1",
              "symbol": "BTC",
              "name": "Bitcoin",
              "supply": "19847912.0000000000000000",
              "maxSupply": "21000000.0000000000000000",
              "marketCapUsd": "1567872239868.9874491121708904",
              "volumeUsd24Hr": "39095048674.8950640942266723",
              "priceUsd": "78994.3163728752651217",
              "changePercent24Hr": "-4.4044974377879880",
              "vwap24Hr": "78016.7657658712668747",
              "explorer": "https://blockchain.info/"
            });
          },
          child: const Icon(Icons.navigation),
        ),
      body: const Center(
        child: Text("data"),
      ),
    );
  }
}