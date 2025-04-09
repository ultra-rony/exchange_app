import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/entities/user_entity.dart';
import 'package:exchange_app/src/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetStoredUserByLoginPasswordUseCase
    extends GenericUseCase<UserEntity?, Map<String, dynamic>> {
  final UserRepository _userRepository;

  GetStoredUserByLoginPasswordUseCase(this._userRepository);

  @override
  Future<UserEntity?> call({Map<String, dynamic>? params}) async {
    return await _userRepository.getStoredUserByLoginPassword(
      params?['login'] ?? "",
      params?['password'] ?? "",
    );
  }
}
