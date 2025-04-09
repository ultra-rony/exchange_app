import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:exchange_app/src/domain/entities/cryptocurrency_entity.dart';

part 'cryptocurrency_model.freezed.dart';

part 'cryptocurrency_model.g.dart';

@freezed
abstract class CryptocurrencyModel extends CryptocurrencyEntity
    with _$CryptocurrencyModel {
  factory CryptocurrencyModel({
    required String? id,
    required String? rank,
    required String? symbol,
    required String? name,
    required String? supply,
    required String? maxSupply,
    required String? marketCapUsd,
    required String? volumeUsd24Hr,
    required String? priceUsd,
    required String? changePercent24Hr,
    required String? vwap24Hr,
    required String? explorer,
  }) = _CryptocurrencyModel;

  factory CryptocurrencyModel.fromCryptocurrency(
    CryptocurrencyEntity? cryptocurrencyEntity,
  ) {
    return CryptocurrencyModel(
      id: cryptocurrencyEntity?.id ?? '',
      rank: cryptocurrencyEntity?.rank ?? '',
      symbol: cryptocurrencyEntity?.symbol ?? '',
      name: cryptocurrencyEntity?.name ?? '',
      supply: cryptocurrencyEntity?.supply ?? '',
      maxSupply: cryptocurrencyEntity?.maxSupply ?? '',
      marketCapUsd: cryptocurrencyEntity?.marketCapUsd ?? '',
      volumeUsd24Hr: cryptocurrencyEntity?.volumeUsd24Hr ?? '',
      priceUsd: cryptocurrencyEntity?.priceUsd ?? '',
      changePercent24Hr: cryptocurrencyEntity?.changePercent24Hr ?? '',
      vwap24Hr: cryptocurrencyEntity?.vwap24Hr ?? '',
      explorer: cryptocurrencyEntity?.explorer ?? '',
    );
  }

  factory CryptocurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CryptocurrencyModelFromJson(json);

  CryptocurrencyModel._() : super();
}
