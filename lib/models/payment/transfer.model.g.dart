// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferModel _$TransferModelFromJson(Map<String, dynamic> json) =>
    TransferModel()
      ..id = json['id'] as String?
      ..entity = json['entity'] as String?
      ..status = json['status'] as String?
      ..source = json['source'] as String?
      ..recipient = json['recipient'] as String?
      ..account = json['account'] as String?
      ..amount = (json['amount'] as num?)?.toDouble()
      ..currency = json['currency'] as String?
      ..amountReversed = json['amount_reversed'] as int?
      ..notes = json['notes'] == null
          ? null
          : NotesModel.fromJson(json['notes'] as Map<String, dynamic>)
      ..linkedAccountNotes = (json['linked_account_notes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..onHold = json['on_hold'] as bool?
      ..onHoldUntil = json['on_hold_until'] as int?
      ..recipientSettlementId = json['recipient_settlement_id']
      ..createdAt = json['created_at'] as int?
      ..processedAt = json['processed_at']
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>)
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => TransferModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..transfers = (json['transfers'] as List<dynamic>?)
          ?.map((e) => TransferModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TransferModelToJson(TransferModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('entity', instance.entity);
  writeNotNull('status', instance.status);
  writeNotNull('source', instance.source);
  writeNotNull('recipient', instance.recipient);
  writeNotNull('account', instance.account);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('amount_reversed', instance.amountReversed);
  writeNotNull('notes', instance.notes);
  writeNotNull('linked_account_notes', instance.linkedAccountNotes);
  writeNotNull('on_hold', instance.onHold);
  writeNotNull('on_hold_until', instance.onHoldUntil);
  writeNotNull('recipient_settlement_id', instance.recipientSettlementId);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('processed_at', instance.processedAt);
  writeNotNull('error', instance.error);
  writeNotNull('items', instance.items);
  writeNotNull('transfers', instance.transfers);
  return val;
}
