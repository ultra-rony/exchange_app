import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class CryptocurrenciesDataSource {
  final Database _database;

  CryptocurrenciesDataSource(this._database);

  Future<List<Map<String, dynamic>>> fetchCryptocurrencies() async {
    return await _database.query('cryptocurrencies');
  }
}