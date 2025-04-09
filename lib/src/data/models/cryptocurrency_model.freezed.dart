// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cryptocurrency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CryptocurrencyModel {

 String? get id; String? get rank; String? get symbol; String? get name; String? get supply; String? get maxSupply; String? get marketCapUsd; String? get volumeUsd24Hr; String? get priceUsd; String? get changePercent24Hr; String? get vwap24Hr; String? get explorer;
/// Create a copy of CryptocurrencyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CryptocurrencyModelCopyWith<CryptocurrencyModel> get copyWith => _$CryptocurrencyModelCopyWithImpl<CryptocurrencyModel>(this as CryptocurrencyModel, _$identity);

  /// Serializes this CryptocurrencyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CryptocurrencyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.supply, supply) || other.supply == supply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&(identical(other.marketCapUsd, marketCapUsd) || other.marketCapUsd == marketCapUsd)&&(identical(other.volumeUsd24Hr, volumeUsd24Hr) || other.volumeUsd24Hr == volumeUsd24Hr)&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd)&&(identical(other.changePercent24Hr, changePercent24Hr) || other.changePercent24Hr == changePercent24Hr)&&(identical(other.vwap24Hr, vwap24Hr) || other.vwap24Hr == vwap24Hr)&&(identical(other.explorer, explorer) || other.explorer == explorer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rank,symbol,name,supply,maxSupply,marketCapUsd,volumeUsd24Hr,priceUsd,changePercent24Hr,vwap24Hr,explorer);

@override
String toString() {
  return 'CryptocurrencyModel(id: $id, rank: $rank, symbol: $symbol, name: $name, supply: $supply, maxSupply: $maxSupply, marketCapUsd: $marketCapUsd, volumeUsd24Hr: $volumeUsd24Hr, priceUsd: $priceUsd, changePercent24Hr: $changePercent24Hr, vwap24Hr: $vwap24Hr, explorer: $explorer)';
}


}

/// @nodoc
abstract mixin class $CryptocurrencyModelCopyWith<$Res>  {
  factory $CryptocurrencyModelCopyWith(CryptocurrencyModel value, $Res Function(CryptocurrencyModel) _then) = _$CryptocurrencyModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? rank, String? symbol, String? name, String? supply, String? maxSupply, String? marketCapUsd, String? volumeUsd24Hr, String? priceUsd, String? changePercent24Hr, String? vwap24Hr, String? explorer
});




}
/// @nodoc
class _$CryptocurrencyModelCopyWithImpl<$Res>
    implements $CryptocurrencyModelCopyWith<$Res> {
  _$CryptocurrencyModelCopyWithImpl(this._self, this._then);

  final CryptocurrencyModel _self;
  final $Res Function(CryptocurrencyModel) _then;

/// Create a copy of CryptocurrencyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rank = freezed,Object? symbol = freezed,Object? name = freezed,Object? supply = freezed,Object? maxSupply = freezed,Object? marketCapUsd = freezed,Object? volumeUsd24Hr = freezed,Object? priceUsd = freezed,Object? changePercent24Hr = freezed,Object? vwap24Hr = freezed,Object? explorer = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,supply: freezed == supply ? _self.supply : supply // ignore: cast_nullable_to_non_nullable
as String?,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as String?,marketCapUsd: freezed == marketCapUsd ? _self.marketCapUsd : marketCapUsd // ignore: cast_nullable_to_non_nullable
as String?,volumeUsd24Hr: freezed == volumeUsd24Hr ? _self.volumeUsd24Hr : volumeUsd24Hr // ignore: cast_nullable_to_non_nullable
as String?,priceUsd: freezed == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as String?,changePercent24Hr: freezed == changePercent24Hr ? _self.changePercent24Hr : changePercent24Hr // ignore: cast_nullable_to_non_nullable
as String?,vwap24Hr: freezed == vwap24Hr ? _self.vwap24Hr : vwap24Hr // ignore: cast_nullable_to_non_nullable
as String?,explorer: freezed == explorer ? _self.explorer : explorer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CryptocurrencyModel extends CryptocurrencyModel {
   _CryptocurrencyModel({required this.id, required this.rank, required this.symbol, required this.name, required this.supply, required this.maxSupply, required this.marketCapUsd, required this.volumeUsd24Hr, required this.priceUsd, required this.changePercent24Hr, required this.vwap24Hr, required this.explorer}): super._();
  factory _CryptocurrencyModel.fromJson(Map<String, dynamic> json) => _$CryptocurrencyModelFromJson(json);

@override final  String? id;
@override final  String? rank;
@override final  String? symbol;
@override final  String? name;
@override final  String? supply;
@override final  String? maxSupply;
@override final  String? marketCapUsd;
@override final  String? volumeUsd24Hr;
@override final  String? priceUsd;
@override final  String? changePercent24Hr;
@override final  String? vwap24Hr;
@override final  String? explorer;

/// Create a copy of CryptocurrencyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CryptocurrencyModelCopyWith<_CryptocurrencyModel> get copyWith => __$CryptocurrencyModelCopyWithImpl<_CryptocurrencyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CryptocurrencyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CryptocurrencyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.supply, supply) || other.supply == supply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&(identical(other.marketCapUsd, marketCapUsd) || other.marketCapUsd == marketCapUsd)&&(identical(other.volumeUsd24Hr, volumeUsd24Hr) || other.volumeUsd24Hr == volumeUsd24Hr)&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd)&&(identical(other.changePercent24Hr, changePercent24Hr) || other.changePercent24Hr == changePercent24Hr)&&(identical(other.vwap24Hr, vwap24Hr) || other.vwap24Hr == vwap24Hr)&&(identical(other.explorer, explorer) || other.explorer == explorer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rank,symbol,name,supply,maxSupply,marketCapUsd,volumeUsd24Hr,priceUsd,changePercent24Hr,vwap24Hr,explorer);

@override
String toString() {
  return 'CryptocurrencyModel(id: $id, rank: $rank, symbol: $symbol, name: $name, supply: $supply, maxSupply: $maxSupply, marketCapUsd: $marketCapUsd, volumeUsd24Hr: $volumeUsd24Hr, priceUsd: $priceUsd, changePercent24Hr: $changePercent24Hr, vwap24Hr: $vwap24Hr, explorer: $explorer)';
}


}

/// @nodoc
abstract mixin class _$CryptocurrencyModelCopyWith<$Res> implements $CryptocurrencyModelCopyWith<$Res> {
  factory _$CryptocurrencyModelCopyWith(_CryptocurrencyModel value, $Res Function(_CryptocurrencyModel) _then) = __$CryptocurrencyModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? rank, String? symbol, String? name, String? supply, String? maxSupply, String? marketCapUsd, String? volumeUsd24Hr, String? priceUsd, String? changePercent24Hr, String? vwap24Hr, String? explorer
});




}
/// @nodoc
class __$CryptocurrencyModelCopyWithImpl<$Res>
    implements _$CryptocurrencyModelCopyWith<$Res> {
  __$CryptocurrencyModelCopyWithImpl(this._self, this._then);

  final _CryptocurrencyModel _self;
  final $Res Function(_CryptocurrencyModel) _then;

/// Create a copy of CryptocurrencyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rank = freezed,Object? symbol = freezed,Object? name = freezed,Object? supply = freezed,Object? maxSupply = freezed,Object? marketCapUsd = freezed,Object? volumeUsd24Hr = freezed,Object? priceUsd = freezed,Object? changePercent24Hr = freezed,Object? vwap24Hr = freezed,Object? explorer = freezed,}) {
  return _then(_CryptocurrencyModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,supply: freezed == supply ? _self.supply : supply // ignore: cast_nullable_to_non_nullable
as String?,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as String?,marketCapUsd: freezed == marketCapUsd ? _self.marketCapUsd : marketCapUsd // ignore: cast_nullable_to_non_nullable
as String?,volumeUsd24Hr: freezed == volumeUsd24Hr ? _self.volumeUsd24Hr : volumeUsd24Hr // ignore: cast_nullable_to_non_nullable
as String?,priceUsd: freezed == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as String?,changePercent24Hr: freezed == changePercent24Hr ? _self.changePercent24Hr : changePercent24Hr // ignore: cast_nullable_to_non_nullable
as String?,vwap24Hr: freezed == vwap24Hr ? _self.vwap24Hr : vwap24Hr // ignore: cast_nullable_to_non_nullable
as String?,explorer: freezed == explorer ? _self.explorer : explorer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
