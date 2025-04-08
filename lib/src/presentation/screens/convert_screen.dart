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
    return Column(
      children: [
        TextButton(
          onPressed: () {
            _showDialog(
              context,
              RatePickerWidget(
                cryptocurrencies: state.cryptocurrencies,
                isConvertFrom: true,
              ),
            );
          },
          child: Text("dsadsasad"),
        ),
        Text("from"),
        Text("${state.from?.symbol}"),
        SizedBox(height: 30),
        TextButton(
          onPressed: () {
            _showDialog(
              context,
              RatePickerWidget(
                cryptocurrencies: state.cryptocurrencies,
                isConvertFrom: false,
              ),
            );
          },
          child: Text("dsadsasad"),
        ),
        Text("to"),
        Text("${state.to?.symbol}"),
      ],
    );
  }
}
