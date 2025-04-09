import 'package:exchange_app/core/extensions/currency_formatter_extension.dart';
import 'package:exchange_app/core/utils/constants.dart';
import 'package:exchange_app/core/utils/currency_calculator.dart';
import 'package:exchange_app/src/cubits/cryptocurrency/cryptocurrency_cubit.dart';
import 'package:exchange_app/src/presentation/widgets/rate_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertScreen extends StatelessWidget {
  const ConvertScreen({super.key});

  void _showDialog(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder:
          (BuildContext context) => Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(top: false, child: child),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CryptocurrencyCubit>().state;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "From",
              textAlign: TextAlign.start,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            OutlinedButton.icon(
              onPressed: () {
                _showDialog(
                  context,
                  RatePickerWidget(
                    cryptocurrencies: state.cryptocurrencies,
                    isConvertFrom: true,
                  ),
                );
              },
              icon: const Icon(Icons.arrow_downward_rounded),
              label: Text(state.from?.symbol ?? "Select currency"),
              iconAlignment: IconAlignment.end,
            ),
            const SizedBox(height: 30),
            Text(
              "To",
              textAlign: TextAlign.start,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            OutlinedButton.icon(
              onPressed: () {
                _showDialog(
                  context,
                  RatePickerWidget(
                    cryptocurrencies: state.cryptocurrencies,
                    isConvertFrom: false,
                  ),
                );
              },
              icon: const Icon(Icons.arrow_downward_rounded),
              label: Text(state.to?.symbol ?? "Select currency"),
              iconAlignment: IconAlignment.end,
            ),
            const SizedBox(height: 30),
            Text(
              "Amount",
              textAlign: TextAlign.start,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(labelText: '0.00'),
                    onChanged: (value) {
                      context.read<CryptocurrencyCubit>().convertSelect(
                        isConvertFrom: true,
                        from: state.from,
                        to: state.to,
                        isAmount: true,
                        amount: double.tryParse(value.replaceAll(",", ".")),
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () => FocusScope.of(context).unfocus(),
                  icon: const Icon(Icons.keyboard_alt_outlined),
                ),
              ],
            ),
            const SizedBox(height: 30),
            if (state.from != null && state.to != null && state.amount != null)
              Builder(
                builder: (context) {
                  final convert = CurrencyConverter(
                    double.parse(state.from?.priceUsd ?? "0"),
                    double.parse(state.to?.priceUsd ?? "0"),
                    state.amount ?? 0,
                  );
                  final commission = TransferFee(
                    Constants.commission,
                    convert.calc(),
                  );
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${commission.calc().toString().limitDecimalPlaces()} ${state.to?.symbol}",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${convert.calc().toString().limitDecimalPlaces()} ${state.to?.symbol} + ${Constants.commission}%",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
