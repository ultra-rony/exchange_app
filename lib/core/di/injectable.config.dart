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
import 'package:exchange_app/src/cubits/auth/auth_cubit.dart' as _i878;
import 'package:exchange_app/src/cubits/cryptocurrency/cryptocurrency_cubit.dart'
    as _i677;
import 'package:exchange_app/src/cubits/navigation/navigation_cubit.dart'
    as _i524;
import 'package:exchange_app/src/data/datasources/remote_cryptocurrencies_data_source.dart'
    as _i353;
import 'package:exchange_app/src/data/datasources/stored_cryptocurrencies_data_source.dart'
    as _i667;
import 'package:exchange_app/src/data/datasources/stored_users_data_source.dart'
    as _i138;
import 'package:exchange_app/src/data/repositories/auth_shared_repository_impl.dart'
    as _i38;
import 'package:exchange_app/src/data/repositories/cryptocurrency_repository_impl.dart'
    as _i366;
import 'package:exchange_app/src/data/repositories/user_repository_impl.dart'
    as _i332;
import 'package:exchange_app/src/domain/repositories/auth_shared_repository.dart'
    as _i218;
import 'package:exchange_app/src/domain/repositories/cryptocurrency_repository.dart'
    as _i572;
import 'package:exchange_app/src/domain/repositories/user_repository.dart'
    as _i1023;
import 'package:exchange_app/src/domain/usecases/add_stored_cryptocurrency_use_case.dart'
    as _i873;
import 'package:exchange_app/src/domain/usecases/add_stored_user_use_case.dart'
    as _i202;
import 'package:exchange_app/src/domain/usecases/get_cache_login_use_case.dart'
    as _i957;
import 'package:exchange_app/src/domain/usecases/get_remote_cryptocurrencies_use_case.dart'
    as _i340;
import 'package:exchange_app/src/domain/usecases/get_stored_cryptocurrencies_use_case.dart'
    as _i474;
import 'package:exchange_app/src/domain/usecases/get_stored_user_by_login_password_use_case.dart'
    as _i833;
import 'package:exchange_app/src/domain/usecases/get_stored_users_use_case.dart'
    as _i595;
import 'package:exchange_app/src/domain/usecases/remove_cache_login_use_case.dart'
    as _i943;
import 'package:exchange_app/src/domain/usecases/save_cache_login_use_case.dart'
    as _i598;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
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
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    await gh.factoryAsync<_i779.Database>(
      () => registerModule.database,
      preResolve: true,
    );
    gh.factory<_i524.NavigationCubit>(() => _i524.NavigationCubit());
    gh.factory<_i353.RemoteCryptocurrenciesDataSource>(
      () => _i353.RemoteCryptocurrenciesDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i218.AuthSharedRepository>(
      () => _i38.AuthSharedRepositoryImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i138.StoredUsersDataSource>(
      () => _i138.StoredUsersDataSource(gh<_i779.Database>()),
    );
    gh.factory<_i667.StoredCryptocurrenciesDataSource>(
      () => _i667.StoredCryptocurrenciesDataSource(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i572.CryptocurrencyRepository>(
      () => _i366.CryptocurrencyRepositoryImpl(
        gh<_i667.StoredCryptocurrenciesDataSource>(),
        gh<_i353.RemoteCryptocurrenciesDataSource>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.lazySingleton<_i1023.UserRepository>(
      () => _i332.UserRepositoryImpl(gh<_i138.StoredUsersDataSource>()),
    );
    gh.factory<_i943.RemoveCacheLoginUseCase>(
      () => _i943.RemoveCacheLoginUseCase(gh<_i218.AuthSharedRepository>()),
    );
    gh.factory<_i957.GetCacheLoginUseCase>(
      () => _i957.GetCacheLoginUseCase(gh<_i218.AuthSharedRepository>()),
    );
    gh.factory<_i598.SaveCacheLoginUseCase>(
      () => _i598.SaveCacheLoginUseCase(gh<_i218.AuthSharedRepository>()),
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
    gh.factory<_i474.GetStoredCryptocurrenciesUseCase>(
      () => _i474.GetStoredCryptocurrenciesUseCase(
        gh<_i572.CryptocurrencyRepository>(),
      ),
    );
    gh.factory<_i833.GetStoredUserByLoginPasswordUseCase>(
      () => _i833.GetStoredUserByLoginPasswordUseCase(
        gh<_i1023.UserRepository>(),
      ),
    );
    gh.factory<_i202.AddStoredUserUseCase>(
      () => _i202.AddStoredUserUseCase(gh<_i1023.UserRepository>()),
    );
    gh.factory<_i595.GetStoredUsersUseCase>(
      () => _i595.GetStoredUsersUseCase(gh<_i1023.UserRepository>()),
    );
    gh.factory<_i878.AuthCubit>(
      () => _i878.AuthCubit(
        gh<_i957.GetCacheLoginUseCase>(),
        gh<_i598.SaveCacheLoginUseCase>(),
        gh<_i943.RemoveCacheLoginUseCase>(),
        gh<_i833.GetStoredUserByLoginPasswordUseCase>(),
        gh<_i595.GetStoredUsersUseCase>(),
        gh<_i202.AddStoredUserUseCase>(),
      ),
    );
    gh.factory<_i677.CryptocurrencyCubit>(
      () => _i677.CryptocurrencyCubit(
        gh<_i474.GetStoredCryptocurrenciesUseCase>(),
        gh<_i340.GetRemoteCryptocurrenciesUseCase>(),
        gh<_i873.AddStoredCryptocurrencyUseCase>(),
        gh<_i974.Logger>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i68.RegisterModule {}
