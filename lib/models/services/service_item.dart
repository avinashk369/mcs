import 'package:json_annotation/json_annotation.dart';
part 'service_item.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ServiceItem {
  String? name;
  String? id;
  String? serviceImage;
  ServiceItem();
  factory ServiceItem.fromJson(Map<String, dynamic> json) =>
      _$ServiceItemFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceItemToJson(this);
}
