import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/repositories/cryptocurrency_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddStoredCryptocurrencyUseCase
    extends GenericUseCase<void, Map<String, dynamic>> {
  final CryptocurrencyRepository _cryptocurrenciesRepository;

  AddStoredCryptocurrencyUseCase(this._cryptocurrenciesRepository);

  @override
  Future call({Map<String, dynamic>? params}) async {
    return await _cryptocurrenciesRepository.insertStoredCryptocurrency(
      params!,
    );
  }
}
