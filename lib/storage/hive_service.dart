import 'package:hive_flutter/hive_flutter.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/app_constants.dart';

import 'cart_item.dart';

class HiveService {
  static late final Box box;
  HiveService._();
  static HiveService? _instance;
  static Future<HiveService> getInstance() async {
    _instance ??= HiveService._();
    await _init();
    return _instance!;
  }

  static Future<void> _init() async {
    try {
      await Hive.initFlutter();
      _registerAdapter();
      box = await Hive.openBox<CartItem>(hiveUserCart);
    } catch (e, stackTrace) {
      print(stackTrace.toString());
    }
  }

  static void _registerAdapter() {
    Hive.registerAdapter(CartItemAdapter()); // Register the CartItem adapter
  }

  /// add product into cart
  static void addToCart(ProductModel product, String userId) {
    try {
      CartItem? item = checkProduct(product);
      if (item != null) {
        item.quantity += product.count;
        item.price = product.variant![product.index].price!;
        item.save();
      } else {
        final cartItem = CartItem(
          productId: product.productId!,
          price: product.variant![product.index].price!,
          quantity: product.count,
          productImage: product.productImage!,
          productName: product.name!,
          userId: userId,
        );
        box.add(cartItem);
      }
    } catch (e) {}
  }

  static closeHive() {
    box.close();
  }

  /// check if product does exist
  static CartItem? checkProduct(ProductModel product) {
    try {
      return box.values.toList().firstWhere(
          (element) => element.productId == product.productId,
          orElse: () => null);
    } catch (e) {
      return null;
    }
  }

  /// read cart items
  static List<CartItem> getCartItems(String userId) =>
      (box.values.where((element) => element.userId == userId).toList())
          as List<CartItem>;

  /// delete cart by item
  static Future<void> deleteCartItem(ProductModel product) async {
    try {
      final itemToDelete = box.values.toList().firstWhere(
          (element) => element.productId == product.productId,
          orElse: () => null);
      if (itemToDelete != null) {
        await itemToDelete.delete();
      }
    } catch (e) {}
  }

  /// delete cart by user id
  static void deleteCartByUserId(String userId) {
    box.clear();
  }

  /// delete all the items
  static void deleteAll() => box.clear();

  /// update cart
  void updateCart(CartItem product, int quantity, String userId) {
    final cartBox = Hive.box(hiveUserCart);

    final cartItem = CartItem(
      productId: product.productId,
      price: product.price,
      quantity: product.quantity,
      productImage: product.productImage,
      productName: product.productName,
      userId: userId,
    );
    cartBox.add(cartItem);
  }
}
