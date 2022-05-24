import 'package:json_annotation/json_annotation.dart';
part 'order.model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class OrderModel {
  String? id;
  String? entity;
  double? amount;
  int? amountPaid;
  int? amountDue;
  String? currency;
  String? receipt;
  dynamic offerId;
  String? status;
  int? attempts;
  int? createdAt;
  OrderModel();
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
