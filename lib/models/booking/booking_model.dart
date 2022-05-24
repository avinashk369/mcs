import 'package:json_annotation/json_annotation.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/models/payment/order.model.dart';
part 'booking_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BookingModel {
  MerchantModel? merchant;
  String? bookingTime;
  String? bookingStatus;
  @JsonKey(name: '_id')
  String? id;
  String? userId;
  UserVehicleModel? vehicle;
  UserModel? user;
  int? duration;
  double? price;
  bool? isPaid;
  bool? isCancelled;
  OrderModel? orderModel;
  String? orderId;
  BookingModel();
  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
