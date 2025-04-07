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
import 'package:exchange_app/src/data/datasources/remote_cryptocurrencies_data_source.dart'
    as _i353;
import 'package:exchange_app/src/data/datasources/stored_cryptocurrencies_data_source.dart'
    as _i667;
import 'package:exchange_app/src/data/datasources/stored_users_data_source.dart'
    as _i138;
import 'package:exchange_app/src/data/repositories/cryptocurrency_repository_impl.dart'
    as _i366;
import 'package:exchange_app/src/data/repositories/user_repository_impl.dart'
    as _i332;
import 'package:exchange_app/src/domain/repositories/cryptocurrency_repository.dart'
    as _i572;
import 'package:exchange_app/src/domain/repositories/user_repository.dart'
    as _i1023;
import 'package:exchange_app/src/domain/usecases/add_stored_cryptocurrency_use_case.dart'
    as _i873;
import 'package:exchange_app/src/domain/usecases/get_remote_cryptocurrencies_use_case.dart'
    as _i340;
import 'package:exchange_app/src/domain/usecases/get_stored_cryptocurrencies_use_case.dart'
    as _i474;
import 'package:exchange_app/src/domain/usecases/get_stored_users_use_case.dart'
    as _i595;
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
    gh.factory<_i353.RemoteCryptocurrenciesDataSource>(
      () => _i353.RemoteCryptocurrenciesDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i667.StoredCryptocurrenciesDataSource>(
      () => _i667.StoredCryptocurrenciesDataSource(gh<_i779.Database>()),
    );
    gh.factory<_i138.StoredUsersDataSource>(
      () => _i138.StoredUsersDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i1023.UserRepository>(
      () => _i332.UserRepositoryImpl(
        gh<_i138.StoredUsersDataSource>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i595.GetStoredUsersUseCase>(
      () => _i595.GetStoredUsersUseCase(gh<_i1023.UserRepository>()),
    );
    gh.lazySingleton<_i572.CryptocurrencyRepository>(
      () => _i366.CryptocurrencyRepositoryImpl(
        gh<_i667.StoredCryptocurrenciesDataSource>(),
        gh<_i353.RemoteCryptocurrenciesDataSource>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i474.GetStoredCryptocurrenciesUseCase>(
      () => _i474.GetStoredCryptocurrenciesUseCase(
        gh<_i572.CryptocurrencyRepository>(),
      ),
    );
    gh.factory<_i873.AddStoredCryptocurrencyUseCase>(
      () => _i873.AddStoredCryptocurrencyUseCase(
        gh<_i572.CryptocurrencyRepository>(),
      ),
    );
    gh.factory<_i340.GetRemoteCryptocurrenciesUseCase>(
      () => _i340.GetRemoteCryptocurrenciesUseCase(
        gh<_i572.CryptocurrencyRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i68.RegisterModule {}
