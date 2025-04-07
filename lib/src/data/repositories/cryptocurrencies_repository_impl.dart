import 'package:exchange_app/src/data/datasources/cryptocurrencies_data_source.dart';
import 'package:exchange_app/src/data/models/cryptocurrency_model.dart';
import 'package:exchange_app/src/domain/repositories/cryptocurrencies_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CryptocurrenciesRepository)
class CryptocurrenciesRepositoryImpl implements CryptocurrenciesRepository {
  final CryptocurrenciesDataSource _cryptocurrenciesDataSource;

  CryptocurrenciesRepositoryImpl(this._cryptocurrenciesDataSource);

  @override
  Future<List<CryptocurrencyModel>> getStoredCryptocurrencies() async {
    final resp = await _cryptocurrenciesDataSource.fetchCryptocurrencies();
    return resp
        .map<CryptocurrencyModel>((item) => CryptocurrencyModel.fromJson(item))
        .toList();
  }
}
