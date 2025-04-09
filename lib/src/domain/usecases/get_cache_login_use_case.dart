import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/repositories/auth_shared_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCacheLoginUseCase extends GenericUseCase<String?, void> {
  final AuthSharedRepository _authRepository;

  GetCacheLoginUseCase(this._authRepository);

  @override
  Future<String?> call({void params}) async {
    return await _authRepository.getLogin();
  }
}
