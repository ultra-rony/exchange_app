import 'package:exchange_app/src/domain/entities/cryptocurrency_entity.dart';

abstract class CryptocurrenciesRepository {
  Future<List<CryptocurrencyEntity>> getStoredCryptocurrencies();
}