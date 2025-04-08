part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthAuthenticatedState extends AuthState {}

final class AuthUnauthenticatedState extends AuthState {}

final class AuthWrongDataState extends AuthState {}
