import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/repositories/auth_shared_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveCacheLoginUseCase extends GenericUseCase<void, void> {
  final AuthSharedRepository _authRepository;

  RemoveCacheLoginUseCase(this._authRepository);

  @override
  Future call({void params}) async {
    return await _authRepository.removeLogin();
  }
}
