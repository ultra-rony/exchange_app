import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static const String baseUrlV3 = "https://rest.coincap.io/v3/";
  static String? coincapApiKey = dotenv.env['COINCAP_API_KEY'];

  static String? login = dotenv.env['LOGIN'];
  static String? password = dotenv.env['PASSWORD'];

  // Ссылка на иконку XXX заменяемая
  // Примечание только маленькие буквы symbol "BTC" to "btc"
  static const String iconUrl = "https://assets.coincap.io/assets/icons/XXX@2x.png";
  // Комиссия за конверт в процентах
  static const double commission = 3.0;
  // Интервал обновление
  static const Duration interval = Duration(seconds: 30);

}