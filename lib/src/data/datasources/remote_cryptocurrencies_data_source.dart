import 'package:dio/dio.dart';
import 'package:exchange_app/core/utils/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteCryptocurrenciesDataSource {
  final Dio _dio;

  RemoteCryptocurrenciesDataSource(this._dio);

  Future<Response> fetchCryptocurrencies() async {
    return await _dio.get(
      '${Constants.baseUrlV3}assets?apiKey=${Constants.coincapApiKey}',
    );
  }
}
