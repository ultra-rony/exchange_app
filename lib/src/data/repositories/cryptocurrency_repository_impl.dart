import 'package:dio/dio.dart';
import 'package:exchange_app/core/states/network_data_state.dart';
import 'package:exchange_app/src/data/datasources/remote_cryptocurrencies_data_source.dart';
import 'package:exchange_app/src/data/datasources/stored_cryptocurrencies_data_source.dart';
import 'package:exchange_app/src/data/models/cryptocurrency_model.dart';
import 'package:exchange_app/src/domain/repositories/cryptocurrency_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: CryptocurrencyRepository)
class CryptocurrencyRepositoryImpl implements CryptocurrencyRepository {
  final StoredCryptocurrenciesDataSource _cryptocurrenciesDataSource;
  final RemoteCryptocurrenciesDataSource _remoteCryptocurrenciesDataSource;
  final Logger _logger;

  CryptocurrencyRepositoryImpl(
    this._cryptocurrenciesDataSource,
    this._remoteCryptocurrenciesDataSource,
    this._logger,
  );

  @override
  Future<List<CryptocurrencyModel>> getStoredCryptocurrencies() async {
    final resp = await _cryptocurrenciesDataSource.fetchCryptocurrencies();
    return resp
        .map<CryptocurrencyModel>((item) => CryptocurrencyModel.fromJson(item))
        .toList();
  }

  @override
  Future insertStoredCryptocurrency(Map<String, dynamic> cryptocurrency) async {
    await _cryptocurrenciesDataSource.insertCryptocurrency(cryptocurrency);
  }

  @override
  Future<NetworkDataState<List<CryptocurrencyModel>>>
  getRemoteCryptocurrencies() async {
    try {
      final httpResponse =
          await _remoteCryptocurrenciesDataSource.fetchCryptocurrencies();
      if (httpResponse.statusCode == 200) {
        return NetworkDataSuccess(
          httpResponse.data['data']
              .map<CryptocurrencyModel>(
                (item) => CryptocurrencyModel.fromJson(item),
              )
              .toList(),
        );
      }
      return NetworkDataFailed(
        DioException(
          error: httpResponse.statusCode,
          response: httpResponse.data,
          requestOptions: httpResponse.requestOptions,
        ),
      );
    } on DioException catch (e) {
      _logger.e("Error while fetching cryptocurrencies", error: e);
      return NetworkDataFailed(e);
    }
  }
}
