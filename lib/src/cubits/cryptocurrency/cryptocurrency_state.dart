part of 'cryptocurrency_cubit.dart';

@immutable
sealed class CryptocurrencyState {
  final List<CryptocurrencyModel>? cryptocurrencies;
  final CryptocurrencyModel? from;
  final CryptocurrencyModel? to;
  final double? amount;

  const CryptocurrencyState({
    this.cryptocurrencies,
    this.from,
    this.to,
    this.amount,
  });
}

final class CryptocurrencyInitState extends CryptocurrencyState {
  const CryptocurrencyInitState({
    super.cryptocurrencies,
    super.from,
    super.to,
    super.amount,
  });
}
