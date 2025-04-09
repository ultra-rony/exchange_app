import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class StoredCryptocurrenciesDataSource {
  final Database _database;

  StoredCryptocurrenciesDataSource(this._database);

  Future insertCryptocurrency(Map<String, dynamic> row) async {
    await _database.insert(
      'cryptocurrencies',
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> fetchCryptocurrencies() async {
    return await _database.query('cryptocurrencies', orderBy: 'rank ASC');
  }
}
