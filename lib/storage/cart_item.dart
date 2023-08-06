import 'package:hive/hive.dart';
part 'cart_item.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  String productId;

  @HiveField(1)
  String productName;

  @HiveField(2)
  int quantity;

  @HiveField(3)
  String price;

  @HiveField(4)
  String productImage;

  @HiveField(5)
  String userId;

  CartItem(
      {required this.productId,
      required this.productName,
      required this.quantity,
      required this.price,
      required this.productImage,
      required this.userId});
}
