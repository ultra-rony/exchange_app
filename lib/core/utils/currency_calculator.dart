abstract class CurrencyCalculator {
  double calc();
}

class CurrencyConverter implements CurrencyCalculator {
  final double from;
  final double to;
  final int amount;

  CurrencyConverter(this.from, this.to, this.amount);

  @override
  double calc() {
    return (from * amount) / to;
  }
}
// Прибавление комиссии
class TransferFee implements CurrencyCalculator {
  final double commission;
  final double totalAmount;

  TransferFee(this.commission, this.totalAmount);

  @override
  double calc() {
    return ((totalAmount * 0.01) * commission) + totalAmount;
  }
}
