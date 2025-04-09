import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/repositories/auth_shared_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveCacheLoginUseCase extends GenericUseCase<void, String> {
  final AuthSharedRepository _authRepository;

  SaveCacheLoginUseCase(this._authRepository);

  @override
  Future call({String? params}) async {
    return await _authRepository.saveLogin(params ?? "");
  }
}
