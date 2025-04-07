import 'package:exchange_app/src/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getStoredUsers();

  Future<UserEntity?> getStoredUser(String login, password);
}