import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressModel {
  String? address;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? landmark;
  String? sId;
  AddressModel();
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
