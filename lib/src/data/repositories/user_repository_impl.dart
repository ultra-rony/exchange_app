import 'package:exchange_app/src/data/datasources/stored_users_data_source.dart';
import 'package:exchange_app/src/data/models/user_model.dart';
import 'package:exchange_app/src/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final StoredUsersDataSource _storedUsersDataSource;

  UserRepositoryImpl(this._storedUsersDataSource);

  @override
  Future<List<UserModel>> getStoredUsers() async {
    final resp = await _storedUsersDataSource.fetchUsers();
    return resp.map<UserModel>((item) => UserModel.fromJson(item)).toList();
  }

  @override
  Future<UserModel?> getStoredUserByLoginPassword(
    String login,
    password,
  ) async {
    final resp = await _storedUsersDataSource.fetchUserByLoginPassword(
      login,
      password,
    );
    return resp == null ? null : UserModel.fromJson(resp);
  }

  @override
  Future addStoredUser(String login, password) async {
    await _storedUsersDataSource.insertUser(login, password);
  }
}
