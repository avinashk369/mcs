import 'package:json_annotation/json_annotation.dart';
part 'merchant_location.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class MerchantLocation {
  String? type;
  List<double>? coordinates;
  MerchantLocation();
  factory MerchantLocation.fromJson(Map<String, dynamic> json) =>
      _$MerchantLocationFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantLocationToJson(this);
}
