// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:exchange_app/core/di/register_module.dart' as _i68;
import 'package:exchange_app/src/data/datasources/stored_cryptocurrencies_data_source.dart'
    as _i667;
import 'package:exchange_app/src/data/repositories/cryptocurrencies_repository_impl.dart'
    as _i568;
import 'package:exchange_app/src/domain/repositories/cryptocurrencies_repository.dart'
    as _i186;
import 'package:exchange_app/src/domain/usecases/get_stored_cryptocurrencies_use_case.dart'
    as _i474;
import 'package:exchange_app/src/domain/usecases/insert_stored_cryptocurrency_use_case.dart'
    as _i580;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:sqflite/sqflite.dart' as _i779;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i974.Logger>(() => registerModule.logger);
    gh.factory<_i361.Dio>(() => registerModule.dio);
    await gh.factoryAsync<_i779.Database>(
      () => registerModule.database,
      preResolve: true,
    );
    gh.factory<_i667.StoredCryptocurrenciesDataSource>(
      () => _i667.StoredCryptocurrenciesDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i186.CryptocurrenciesRepository>(
      () => _i568.CryptocurrenciesRepositoryImpl(
        gh<_i667.StoredCryptocurrenciesDataSource>(),
      ),
    );
    gh.factory<_i474.GetStoredCryptocurrenciesUseCase>(
      () => _i474.GetStoredCryptocurrenciesUseCase(
        gh<_i186.CryptocurrenciesRepository>(),
      ),
    );
    gh.factory<_i580.InsertStoredCryptocurrencyUseCase>(
      () => _i580.InsertStoredCryptocurrencyUseCase(
        gh<_i186.CryptocurrenciesRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i68.RegisterModule {}
