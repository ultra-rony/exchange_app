import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/entities/cryptocurrency_entity.dart';
import 'package:exchange_app/src/domain/repositories/cryptocurrencies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetStoredCryptocurrenciesUseCase
    extends GenericUseCase<List<CryptocurrencyEntity>, void> {
  final CryptocurrenciesRepository _cryptocurrenciesRepository;

  GetStoredCryptocurrenciesUseCase(this._cryptocurrenciesRepository);

  @override
  Future<List<CryptocurrencyEntity>> call({void params}) async {
    return await _cryptocurrenciesRepository.getStoredCryptocurrencies();
  }
}
