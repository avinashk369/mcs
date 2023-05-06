import 'package:freezed_annotation/freezed_annotation.dart';
part 'shipping_model.freezed.dart';
part 'shipping_model.g.dart';

@freezed
class ShippingModel with _$ShippingModel {
  @JsonSerializable(
      includeIfNull: false,
      explicitToJson: true,
      fieldRename: FieldRename.snake)
  const factory ShippingModel({double? shippingCharge}) = _ShippingModel;
  factory ShippingModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingModelFromJson(json);
}
