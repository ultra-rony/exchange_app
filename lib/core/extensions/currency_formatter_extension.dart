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
