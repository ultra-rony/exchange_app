import 'package:exchange_app/core/utils/constants.dart';
import 'package:exchange_app/src/domain/usecases/add_stored_user_use_case.dart';
import 'package:exchange_app/src/domain/usecases/get_cache_login_use_case.dart';
import 'package:exchange_app/src/domain/usecases/get_stored_user_by_login_password_use_case.dart';
import 'package:exchange_app/src/domain/usecases/get_stored_users_use_case.dart';
import 'package:exchange_app/src/domain/usecases/remove_cache_login_use_case.dart';
import 'package:exchange_app/src/domain/usecases/save_cache_login_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final GetCacheLoginUseCase _getCacheLoginUseCase;
  final SaveCacheLoginUseCase _saveCacheLoginUseCase;
  final RemoveCacheLoginUseCase _removeCacheLoginUseCase;
  final GetStoredUserByLoginPasswordUseCase
  _getStoredUserByLoginPasswordUseCase;
  final GetStoredUsersUseCase _getStoredUsersUseCase;
  final AddStoredUserUseCase _addStoredUserUseCase;

  AuthCubit(
    this._getCacheLoginUseCase,
    this._saveCacheLoginUseCase,
    this._removeCacheLoginUseCase,
    this._getStoredUserByLoginPasswordUseCase,
    this._getStoredUsersUseCase,
    this._addStoredUserUseCase,
  ) : super(AuthInitialState());
  // Проверка на авторизацию пользователя
  Future check() async {
    final allUsers = await _getStoredUsersUseCase();
    // Если пользователей нет добаввляем
    if (allUsers.isEmpty) {
      _addStoredUserUseCase(
        params: {
          "login": Constants.login,
          "password": Constants.password,
        }
      );
    }
    final String? cachedLogin = await _getCacheLoginUseCase();
    if ((cachedLogin ?? "").isEmpty) {
      emit(AuthUnauthenticatedState());
      return;
    }
    emit(AuthAuthenticatedState());
  }

  Future logout() async {
    await _removeCacheLoginUseCase();
    emit(AuthUnauthenticatedState());
  }
  // Войти
  Future login(String login, password) async {
    final resp = await _getStoredUserByLoginPasswordUseCase(
      params: {'login': login, 'password': password},
    );
    if (resp == null) {
      emit(AuthWrongDataState("Incorrect login or password"));
      return;
    }
    await _saveCacheLoginUseCase(params: login);
    emit(AuthAuthenticatedState());
  }
  // Сброс ошибки
  reset() => emit(AuthWrongDataState(null));
}
