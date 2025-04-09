import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddStoredUserUseCase extends GenericUseCase<void, Map<String, dynamic>> {
  final UserRepository _userRepository;

  AddStoredUserUseCase(this._userRepository);

  @override
  Future call({Map<String, dynamic>? params}) async {
    return await _userRepository.addStoredUser(
      params?['login'] ?? "",
      params?['password'] ?? "",
    );
  }
}
