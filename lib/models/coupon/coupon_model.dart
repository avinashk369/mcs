import 'package:freezed_annotation/freezed_annotation.dart';
part 'coupon_model.g.dart';
part 'coupon_model.freezed.dart';

@freezed
class CouponModel with _$CouponModel {
  @JsonSerializable(
      includeIfNull: false,
      explicitToJson: true,
      fieldRename: FieldRename.snake)
  const factory CouponModel({double? shippingCharge}) = _CouponModel;
  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
}
