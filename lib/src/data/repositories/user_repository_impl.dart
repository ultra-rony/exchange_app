import 'package:exchange_app/src/data/datasources/stored_users_data_source.dart';
import 'package:exchange_app/src/data/models/user_model.dart';
import 'package:exchange_app/src/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final Logger _logger;
  final StoredUsersDataSource _storedUsersDataSource;

  UserRepositoryImpl(this._storedUsersDataSource, this._logger);

  @override
  Future<List<UserModel>> getStoredUsers() async {
    final resp = await _storedUsersDataSource.fetchUsers();
    return resp.map<UserModel>((item) => UserModel.fromJson(item)).toList();
  }
}
