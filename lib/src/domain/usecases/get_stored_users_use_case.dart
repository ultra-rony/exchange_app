import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/entities/user_entity.dart';
import 'package:exchange_app/src/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetStoredUsersUseCase extends GenericUseCase<List<UserEntity>, void> {
  final UserRepository _userRepository;

  GetStoredUsersUseCase(this._userRepository);

  @override
  Future<List<UserEntity>> call({void params}) async {
    return await _userRepository.getStoredUsers();
  }
}
