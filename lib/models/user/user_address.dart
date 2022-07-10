import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_address.freezed.dart';
part 'user_address.g.dart';

@freezed
class UserAddress with _$UserAddress {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  const factory UserAddress({
    String? id,
    String? userId,
    String? name,
    String? number,
    String? state,
    String? city,
    String? address,
    String? pincode,
    String? landmark,
    @JsonKey(ignore: true) @Default(0) int count,
    double? rating,
  }) = _UserAddress;

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
}
