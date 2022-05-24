import 'package:json_annotation/json_annotation.dart';
part 'payment_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PaymentModel {
  String? id;
  String? status;
  String? userId;
  String? merchantId;
  String? transferId;
  String? orderId;
  String? paymentId;
  String? bookingId;
  double? price;
  String? tRecipient;
  String? tSource;
  PaymentModel();
  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
