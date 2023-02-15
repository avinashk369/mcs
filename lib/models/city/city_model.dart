import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  @JsonSerializable(
      includeIfNull: false,
      explicitToJson: true,
      fieldRename: FieldRename.snake)
  const factory CityModel({
    String? id,
    String? cityName,
  }) = _CityModel;
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
