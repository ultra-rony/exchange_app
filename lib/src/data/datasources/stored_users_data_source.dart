import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class StoredUsersDataSource {
  final Database _database;

  StoredUsersDataSource(this._database);

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    return await _database.query('users');
  }
}
