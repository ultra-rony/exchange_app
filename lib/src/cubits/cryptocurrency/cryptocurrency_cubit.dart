import 'dart:async';

import 'package:exchange_app/core/states/network_data_state.dart';
import 'package:exchange_app/core/utils/constants.dart';
import 'package:exchange_app/src/data/models/cryptocurrency_model.dart';
import 'package:exchange_app/src/domain/usecases/add_stored_cryptocurrency_use_case.dart';
import 'package:exchange_app/src/domain/usecases/get_remote_cryptocurrencies_use_case.dart';
import 'package:exchange_app/src/domain/usecases/get_stored_cryptocurrencies_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'cryptocurrency_state.dart';

@injectable
class CryptocurrencyCubit extends Cubit<CryptocurrencyState> {
  final GetStoredCryptocurrenciesUseCase _getStoredCryptocurrenciesUseCase;
  final GetRemoteCryptocurrenciesUseCase _getRemoteCryptocurrenciesUseCase;
  final AddStoredCryptocurrencyUseCase _addStoredCryptocurrencyUseCase;
  final Logger _logger;

  CryptocurrencyCubit(
    this._getStoredCryptocurrenciesUseCase,
    this._getRemoteCryptocurrenciesUseCase,
    this._addStoredCryptocurrencyUseCase,
    this._logger,
  ) : super(const CryptocurrencyInitState());

  Timer? _timer;

  fetchData() async {
    // Сбрасываем состояние
    emit(const CryptocurrencyInitState());
    final remoteCryptocurrencies = await _getRemoteCryptocurrenciesUseCase();
    if (remoteCryptocurrencies is NetworkDataSuccess) {
      final cryptocurrencies =
          remoteCryptocurrencies?.data as List<CryptocurrencyModel>;
      emit(CryptocurrencyInitState(cryptocurrencies: cryptocurrencies));
      // Сохраняем в локальную базу
      for (var item in cryptocurrencies) {
        _addStoredCryptocurrencyUseCase(params: item.toJson());
      }
    }
  }

  convertSelect({
    CryptocurrencyModel? from,
    CryptocurrencyModel? to,
    double? amount,
    required bool isConvertFrom,
    bool isAmount = false,
  }) async {
    final cryptocurrencies = await _getStoredCryptocurrenciesUseCase();
    // Убираем если повторяется
    final target = isConvertFrom ? to : from;
    final source = isConvertFrom ? from : to;
    if (source != null && source.id == target?.id && !isAmount) {
      if (isConvertFrom) {
        to = null;
      } else {
        from = null;
      }
    }
    emit(
      CryptocurrencyInitState(
        from: from,
        to: to,
        amount: amount,
        cryptocurrencies: cryptocurrencies as List<CryptocurrencyModel>,
      ),
    );
  }

  // Обновляем данные каждые N секунду
  startTimer() async {
    if (_timer != null) return;
    _timer = Timer.periodic(Constants.interval, (Timer timer) async {
      try {
        final remoteCryptocurrencies =
            await _getRemoteCryptocurrenciesUseCase();
        if (remoteCryptocurrencies is NetworkDataSuccess) {
          _logger.d("interval: data updated");
          CryptocurrencyInitState(
            from: state.from,
            to: state.to,
            amount: state.amount,
            cryptocurrencies:
                remoteCryptocurrencies?.data as List<CryptocurrencyModel>,
          );
        }
      } catch (e) {
        _logger.e("interval: error $e");
      }
    });
  }
}
