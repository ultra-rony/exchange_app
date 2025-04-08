import 'package:exchange_app/src/domain/usecases/get_cache_login_use_case.dart';
import 'package:exchange_app/src/domain/usecases/get_stored_user_by_login_password_use_case.dart';
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

  AuthCubit(
    this._getCacheLoginUseCase,
    this._saveCacheLoginUseCase,
    this._removeCacheLoginUseCase,
    this._getStoredUserByLoginPasswordUseCase,
  ) : super(AuthInitialState());

  Future check() async {
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

  Future login(String login, password) async {
    final resp = await _getStoredUserByLoginPasswordUseCase(params: {
      'login': login,
      'password': password,
    });
    if (resp == null) {
      emit(AuthWrongDataState("Incorrect login or password"));
      return;
    }
    await _saveCacheLoginUseCase(params: login);
    emit(AuthAuthenticatedState());
  }

  reset() => emit(AuthWrongDataState(null));

}
