import 'package:json_annotation/json_annotation.dart';
part 'coupon_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CouponModel {
  String? couponCode;
  double? discount;
  CouponModel();
  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
  Map<String, dynamic> toJson() => _$CouponModelToJson(this);
}
