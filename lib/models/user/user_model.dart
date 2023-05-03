import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(
      includeIfNull: false,
      explicitToJson: true,
      fieldRename: FieldRename.snake)
  const factory UserModel({
    String? id,
    String? userId,
    dynamic cityId,
    String? userType,
    dynamic fullname,
    dynamic firstName,
    dynamic lastName,
    dynamic email,
    dynamic username,
    dynamic password,
    String? mobileNo,
    dynamic loginType,
    dynamic identity,
    dynamic profileImage,
    String? deviceType,
    dynamic deviceToken,
    String? status,
    String? createdAt,
    dynamic updatedAt,
    String? otp,
    dynamic referalCode,
    dynamic referredCode,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
