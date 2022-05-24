import 'package:json_annotation/json_annotation.dart';
import 'package:mcs/models/payment/error.model.dart';
import 'package:mcs/models/payment/notes.model.dart';
part 'transfer.model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class TransferModel {
  String? id;
  String? entity;
  String? status;
  String? source;
  String? recipient;
  String? account;
  double? amount;
  String? currency;
  int? amountReversed;
  NotesModel? notes;
  List<String>? linkedAccountNotes;
  bool? onHold;
  int? onHoldUntil;
  dynamic recipientSettlementId;
  int? createdAt;
  dynamic processedAt;
  ErrorModel? error;
  List<TransferModel>? items;
  List<TransferModel>? transfers;
  TransferModel();
  factory TransferModel.fromJson(Map<String, dynamic> json) =>
      _$TransferModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransferModelToJson(this);
}
