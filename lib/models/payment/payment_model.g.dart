// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel()
  ..id = json['id'] as String?
  ..status = json['status'] as String?
  ..userId = json['user_id'] as String?
  ..merchantId = json['merchant_id'] as String?
  ..transferId = json['transfer_id'] as String?
  ..orderId = json['order_id'] as String?
  ..paymentId = json['payment_id'] as String?
  ..bookingId = json['booking_id'] as String?
  ..price = (json['price'] as num?)?.toDouble()
  ..tRecipient = json['t_recipient'] as String?
  ..tSource = json['t_source'] as String?;

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', instance.status);
  writeNotNull('user_id', instance.userId);
  writeNotNull('merchant_id', instance.merchantId);
  writeNotNull('transfer_id', instance.transferId);
  writeNotNull('order_id', instance.orderId);
  writeNotNull('payment_id', instance.paymentId);
  writeNotNull('booking_id', instance.bookingId);
  writeNotNull('price', instance.price);
  writeNotNull('t_recipient', instance.tRecipient);
  writeNotNull('t_source', instance.tSource);
  return val;
}
