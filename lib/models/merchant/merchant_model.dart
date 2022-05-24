import 'package:json_annotation/json_annotation.dart';
import 'package:mcs/models/merchant/address_model.dart';
import 'package:mcs/models/merchant/merchant_location.dart';
import 'package:mcs/models/models.dart' show Reviews, Facilities;
part 'merchant_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MerchantModel {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  AddressModel? address;
  double? lat;
  double? lng;
  double? rating;
  double? hrRate;
  int? spots;
  String? about;
  String? contactId;
  String? fAccId;
  MerchantLocation? location;
  List<MerchantModel>? data;
  List<Reviews>? reviews;
  List<Facilities>? facilities;

  MerchantModel();
  factory MerchantModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantModelFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantModelToJson(this);
}
