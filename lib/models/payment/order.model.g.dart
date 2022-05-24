// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel()
  ..id = json['id'] as String?
  ..entity = json['entity'] as String?
  ..amount = (json['amount'] as num?)?.toDouble()
  ..amountPaid = json['amount_paid'] as int?
  ..amountDue = json['amount_due'] as int?
  ..currency = json['currency'] as String?
  ..receipt = json['receipt'] as String?
  ..offerId = json['offer_id']
  ..status = json['status'] as String?
  ..attempts = json['attempts'] as int?
  ..createdAt = json['created_at'] as int?;

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('entity', instance.entity);
  writeNotNull('amount', instance.amount);
  writeNotNull('amount_paid', instance.amountPaid);
  writeNotNull('amount_due', instance.amountDue);
  writeNotNull('currency', instance.currency);
  writeNotNull('receipt', instance.receipt);
  writeNotNull('offer_id', instance.offerId);
  writeNotNull('status', instance.status);
  writeNotNull('attempts', instance.attempts);
  writeNotNull('created_at', instance.createdAt);
  return val;
}
