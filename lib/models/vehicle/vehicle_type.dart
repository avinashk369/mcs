import 'package:json_annotation/json_annotation.dart';
part 'vehicle_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VehicleType {
  @JsonKey(name: '_id')
  String? id;
  String? vType;
  String? img;
  VehicleType();
  factory VehicleType.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleTypeToJson(this);
}
