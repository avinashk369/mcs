// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel()
  ..merchant = json['merchant'] == null
      ? null
      : MerchantModel.fromJson(json['merchant'] as Map<String, dynamic>)
  ..bookingTime = json['booking_time'] as String?
  ..bookingStatus = json['booking_status'] as String?
  ..id = json['_id'] as String?
  ..userId = json['user_id'] as String?
  ..vehicle = json['vehicle'] == null
      ? null
      : UserVehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>)
  ..user = json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>)
  ..duration = json['duration'] as int?
  ..price = (json['price'] as num?)?.toDouble()
  ..isPaid = json['is_paid'] as bool?
  ..isCancelled = json['is_cancelled'] as bool?
  ..orderModel = json['order_model'] == null
      ? null
      : OrderModel.fromJson(json['order_model'] as Map<String, dynamic>)
  ..orderId = json['order_id'] as String?;

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('merchant', instance.merchant);
  writeNotNull('booking_time', instance.bookingTime);
  writeNotNull('booking_status', instance.bookingStatus);
  writeNotNull('_id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('vehicle', instance.vehicle);
  writeNotNull('user', instance.user);
  writeNotNull('duration', instance.duration);
  writeNotNull('price', instance.price);
  writeNotNull('is_paid', instance.isPaid);
  writeNotNull('is_cancelled', instance.isCancelled);
  writeNotNull('order_model', instance.orderModel);
  writeNotNull('order_id', instance.orderId);
  return val;
}
