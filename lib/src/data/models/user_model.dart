import 'package:exchange_app/src/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class UserModel extends UserEntity with _$UserModel {
  factory UserModel({
    required String? id,
    required String? login,
    required String? password,
  }) = _UserModel;

  factory UserModel.fromUser(UserEntity? userEntity) {
    return UserModel(
      id: userEntity?.id ?? '',
      login: userEntity?.login ?? '',
      password: userEntity?.password ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel._() : super();
}
