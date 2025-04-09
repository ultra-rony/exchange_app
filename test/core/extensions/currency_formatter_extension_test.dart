import 'package:flutter_test/flutter_test.dart';

extension CurrencyFormatterExtension on String {
  // Ограничивает количество цифр после точки до максимум 18.
  String limitDecimalPlaces() {
    final parts = split('.');
    if (parts.length == 1) {
      return this;
    }
    final integerPart = parts[0];
    var fractionalPart = parts[1];
    // Обрезаем дробную часть до 18 символов
    if (fractionalPart.length > 18) {
      fractionalPart = fractionalPart.substring(0, 18);
    }
    return '$integerPart.$fractionalPart';
  }
}

void main() {
  group('CurrencyFormatterExtension Tests', () {
    test('No decimal point should return the same string', () {
      const input = '12345';
      expect(input.limitDecimalPlaces(), equals('12345'));
    });

    test('Decimal part less than 18 digits should remain unchanged', () {
      const input = '12345.6789';
      expect(input.limitDecimalPlaces(), equals('12345.6789'));
    });

    test('Decimal part exactly 18 digits should remain unchanged', () {
      const input = '12345.123456789012345678';
      expect(input.limitDecimalPlaces(), equals('12345.123456789012345678'));
    });

    test('Decimal part more than 18 digits should be truncated', () {
      const input = '12345.12345678901234567890';
      expect(input.limitDecimalPlaces(), equals('12345.123456789012345678'));
    });
  });
}
