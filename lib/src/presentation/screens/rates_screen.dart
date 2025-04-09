import 'package:exchange_app/src/cubits/cryptocurrency/cryptocurrency_cubit.dart';
import 'package:exchange_app/src/presentation/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatesScreen extends StatelessWidget {
  const RatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CryptocurrencyCubit>().state;
    return Builder(
      builder: (context) {
        if (state.cryptocurrencies == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: state.cryptocurrencies?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return RateWidget(
              symbol: state.cryptocurrencies?[index].symbol,
              price: state.cryptocurrencies?[index].priceUsd,
            );
          },
        );
      },
    );
  }
}
