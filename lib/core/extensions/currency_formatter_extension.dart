extension CurrencyFormatterExtension on String {
  // Ограничивает количество цифр после точки до максимум 18.
  String limitDecimalPlaces({int max = 18}) {
    final parts = split('.');
    if (parts.length == 1) {
      return this;
    }
    final integerPart = parts[0];
    var fractionalPart = parts[1];
    // Обрезаем дробную часть до N символов
    if (fractionalPart.length > max) {
      fractionalPart = fractionalPart.substring(0, max);
    }
    return '$integerPart.$fractionalPart';
  }
}
