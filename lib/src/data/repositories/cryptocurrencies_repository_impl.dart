import 'package:exchange_app/core/states/network_data_state.dart';
import 'package:exchange_app/src/data/datasources/stored_cryptocurrencies_data_source.dart';
import 'package:exchange_app/src/data/models/cryptocurrency_model.dart';
import 'package:exchange_app/src/domain/entities/cryptocurrency_entity.dart';
import 'package:exchange_app/src/domain/repositories/cryptocurrencies_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CryptocurrenciesRepository)
class CryptocurrenciesRepositoryImpl implements CryptocurrenciesRepository {
  final StoredCryptocurrenciesDataSource _cryptocurrenciesDataSource;

  CryptocurrenciesRepositoryImpl(this._cryptocurrenciesDataSource);

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
}
