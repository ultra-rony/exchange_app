import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/repositories/cryptocurrencies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertStoredCryptocurrencyUseCase
    extends GenericUseCase<void, Map<String, dynamic>> {
  final CryptocurrenciesRepository _cryptocurrenciesRepository;

  InsertStoredCryptocurrencyUseCase(this._cryptocurrenciesRepository);

  @override
  Future call({Map<String, dynamic>? params}) async {
    return await _cryptocurrenciesRepository.insertCryptocurrency(params!);
  }
}
