import 'package:exchange_app/generated/l10n.dart';
import 'package:exchange_app/src/cubits/cryptocurrency/cryptocurrency_cubit.dart';
import 'package:exchange_app/src/data/models/cryptocurrency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatePickerWidget extends StatelessWidget {
  final List<CryptocurrencyModel>? cryptocurrencies;
  final bool isConvertFrom;

  const RatePickerWidget({
    super.key,
    this.cryptocurrencies,
    required this.isConvertFrom,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CryptocurrencyCubit>().state;
    int selected = 0;
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            const Expanded(child: SizedBox()),
            TextButton(
              onPressed: () {
                if (isConvertFrom) {
                  context.read<CryptocurrencyCubit>().convertSelect(
                    isConvertFrom: isConvertFrom,
                    from: cryptocurrencies?[selected],
                    to: state.to,
                    amount: state.amount,
                  );
                } else {
                  context.read<CryptocurrencyCubit>().convertSelect(
                    isConvertFrom: isConvertFrom,
                    from: state.from,
                    to: cryptocurrencies?[selected],
                    amount: state.amount,
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).confirm),
            ),
          ],
        ),
        Expanded(
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 32.0,
            scrollController: FixedExtentScrollController(initialItem: 0),
            onSelectedItemChanged: (int index) {
              selected = index;
            },
            children: [
              for (final item in cryptocurrencies ?? [])
                Center(child: Text(item.symbol)),
            ],
          ),
        ),
      ],
    );
  }
}
