// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      cityId: json['city_id'],
      userType: json['user_type'] as String?,
      fullname: json['fullname'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      mobileNo: json['mobile_no'] as String?,
      loginType: json['login_type'],
      identity: json['identity'],
      profileImage: json['profile_image'],
      deviceType: json['device_type'] as String?,
      deviceToken: json['device_token'],
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'],
      otp: json['otp'] as String?,
      referalCode: json['referal_code'],
      referredCode: json['referred_code'],
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('city_id', instance.cityId);
  writeNotNull('user_type', instance.userType);
  writeNotNull('fullname', instance.fullname);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('email', instance.email);
  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  writeNotNull('mobile_no', instance.mobileNo);
  writeNotNull('login_type', instance.loginType);
  writeNotNull('identity', instance.identity);
  writeNotNull('profile_image', instance.profileImage);
  writeNotNull('device_type', instance.deviceType);
  writeNotNull('device_token', instance.deviceToken);
  writeNotNull('status', instance.status);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('otp', instance.otp);
  writeNotNull('referal_code', instance.referalCode);
  writeNotNull('referred_code', instance.referredCode);
  return val;
}
