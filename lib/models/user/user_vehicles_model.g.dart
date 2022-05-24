// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vehicles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVehicleModel _$UserVehicleModelFromJson(Map<String, dynamic> json) =>
    UserVehicleModel()
      ..id = json['_id'] as String?
      ..uId = json['u_id'] as String?
      ..vType = json['v_type'] == null
          ? null
          : VehicleType.fromJson(json['v_type'] as Map<String, dynamic>)
      ..vModel = json['v_model'] as String?
      ..vNumber = json['v_number'] as String?
      ..data = json['data'] == null
          ? null
          : UserVehicleModel.fromJson(json['data'] as Map<String, dynamic>)
      ..vehicles = (json['vehicles'] as List<dynamic>?)
          ?.map((e) => UserVehicleModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UserVehicleModelToJson(UserVehicleModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('u_id', instance.uId);
  writeNotNull('v_type', instance.vType);
  writeNotNull('v_model', instance.vModel);
  writeNotNull('v_number', instance.vNumber);
  writeNotNull('data', instance.data);
  writeNotNull('vehicles', instance.vehicles);
  return val;
}
