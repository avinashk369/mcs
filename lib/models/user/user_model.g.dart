// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..status = json['status'] as int?
  ..message = json['message'] as String?
  ..data = json['data'] == null
      ? null
      : UserModel.fromJson(json['data'] as Map<String, dynamic>)
  ..token = json['token'] as String?
  ..mobile = json['mobile'] as int?
  ..userType = json['user_type'] as String?
  ..id = json['_id'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('message', instance.message);
  writeNotNull('data', instance.data);
  writeNotNull('token', instance.token);
  writeNotNull('mobile', instance.mobile);
  writeNotNull('user_type', instance.userType);
  writeNotNull('_id', instance.id);
  return val;
}
