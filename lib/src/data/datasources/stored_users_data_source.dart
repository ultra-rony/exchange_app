import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class StoredUsersDataSource {
  final Database _database;

  StoredUsersDataSource(this._database);

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    return await _database.query('users');
  }

  Future<Map<String, dynamic>?> fetchUserByLoginPassword(
    String login,
    password,
  ) async {
    final List<Map<String, dynamic>> result = await _database.query(
      'users',
      where: 'login = ? AND password = ?',
      whereArgs: [login, password],
    );

    if (result.isEmpty) {
      return null;
    }
    return result.first;
  }

  Future insertUser(String login, password) async {
    await _database.insert('users', {
      'login': login,
      'password': password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
