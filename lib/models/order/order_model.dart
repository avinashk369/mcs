import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/models.dart';
part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  const factory OrderModel({
    String? orderId,
    String? totalAmount,
    String? paymentType,
    String? shippingCharge,
    String? couponDiscount,
    String? address,
    String? orderedAt,
    int? totalItem,
    String? status,
    List<ProductModel>? productDetails,
  }) = _OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
