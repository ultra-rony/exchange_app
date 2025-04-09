import 'package:exchange_app/src/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getStoredUsers();

  Future<UserEntity?> getStoredUserByLoginPassword(String login, password);

  Future addStoredUser(String login, password);
}
