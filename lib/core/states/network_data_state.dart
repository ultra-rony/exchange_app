import 'package:dio/dio.dart';

abstract class NetworkDataState<T> {
  final T? data;
  final DioException? error;

  const NetworkDataState({this.data, this.error});
}

class NetworkDataSuccess<T> extends NetworkDataState<T> {
  const NetworkDataSuccess(T data) : super(data: data);
}

class NetworkDataFailed<T> extends NetworkDataState<T> {
  const NetworkDataFailed(DioException error) : super(error: error);
}
