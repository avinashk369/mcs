import 'package:json_annotation/json_annotation.dart';
import 'package:mcs/models/vehicle/vehicle_type.dart';
part 'user_vehicles_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class UserVehicleModel {
  @JsonKey(name: '_id')
  String? id;
  String? uId;
  VehicleType? vType;
  String? vModel;
  String? vNumber;
  UserVehicleModel? data;
  List<UserVehicleModel>? vehicles;
  UserVehicleModel();
  factory UserVehicleModel.fromJson(Map<String, dynamic> json) =>
      _$UserVehicleModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserVehicleModelToJson(this);
}
