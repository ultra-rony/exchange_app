import 'package:exchange_app/core/utils/currency_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyConverter Tests', () {
    test('Converts currency correctly', () {
      final calculator = CurrencyConverter(100, 50, 10);
      final result = calculator.calc();
      expect(result, equals(20.0));
    });

    test('Handles zero amount', () {
      final calculator = CurrencyConverter(100, 50, 0);
      final result = calculator.calc();
      expect(result, equals(0.0));
    });
  });

  group('TransferFee Tests', () {
    test('Adds commission correctly', () {
      final calculator = TransferFee(5, 100);
      final result = calculator.calc();
      expect(result, equals(105.0));
    });

    test('Handles zero commission', () {
      final calculator = TransferFee(0, 100);
      final result = calculator.calc();
      expect(result, equals(100.0));
    });

    test('Handles zero total amount', () {
      final calculator = TransferFee(5, 0);
      final result = calculator.calc();
      expect(result, equals(0.0));
    });
  });
}