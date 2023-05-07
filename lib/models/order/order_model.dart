import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  const factory OrderModel() = _OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
