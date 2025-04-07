import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static const String baseUrlV3 = "https://rest.coincap.io/v3/";
  static String? coincapApiKey = dotenv.env['COINCAP_API_KEY'];
}