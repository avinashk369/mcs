import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  const factory RestaurantModel({
    String? id,
    String? categoryName,
    String? isActive,
    String? createdAt,
    String? updatedAt,
    String? categoryImg,
    String? displayOrder,
    String? parent,
    String? cityId,
    String? showOnInvoice,
  }) = _RestaurantModel;
  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
