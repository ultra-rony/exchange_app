import 'package:exchange_app/core/states/network_data_state.dart';
import 'package:exchange_app/core/usecases/generic_use_case.dart';
import 'package:exchange_app/src/domain/entities/cryptocurrency_entity.dart';
import 'package:exchange_app/src/domain/repositories/cryptocurrencies_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRemoteCryptocurrenciesUseCase
    extends GenericUseCase<NetworkDataState<List<CryptocurrencyEntity>>, void> {
  final CryptocurrenciesRepository _cryptocurrenciesRepository;

  GetRemoteCryptocurrenciesUseCase(this._cryptocurrenciesRepository);

  @override
  Future<NetworkDataState<List<CryptocurrencyEntity>>?> call({void params}) async {
    return await _cryptocurrenciesRepository.getRemoteCryptocurrencies();
  }
}
