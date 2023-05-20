library order_detail_screen;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/models/order/order_model.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/extensions/widget_modifier.dart';
import 'package:mcs/widgets/loading_ui.dart';

import '../../blocs/order/order_bloc.dart';
import '../../blocs/product/product_bloc.dart';
import '../../models/product/product_mode.dart';
import '../../resources/order/order_repositoryImpl.dart';
import '../../routes/route_constants.dart';
import '../../utils/product_utility.dart';
import '../bottom_nav/cart/checkout_screen.dart';
part 'components/ordered_products.dart';
part 'components/order_item_card.dart';
part 'components/order_item.dart';
part 'components/product_card.dart';
part 'components/order_detail_card.dart';
part 'components/bill_detail.dart';

class OrderDetailScreen extends StatelessWidget {
  static const String tag = orderDetail;

  const OrderDetailScreen({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(context.read<OrderRepositoryImpl>())
            ..add(OrderDetail(data: {
              "user_id": PreferenceUtils.getString(user_uid),
              "order_id": orderModel.orderId
            })),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Order Summary"),
              Text(
                "#${orderModel.status!}",
                style: kLabelStyle.copyWith(color: greyColor.withOpacity(.8)),
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  /// render components
                  Builder(builder: (context) {
                    return OrderedProducts(
                      child: (products) => OrderItemCard(
                          orderModel: orderModel, products: products),
                    );
                  }),
                  const SizedBox(height: 10),

                  OrderedProducts(
                    child: (products) =>
                        BillDetail(orderModel: orderModel, products: products),
                  ),
                  const SizedBox(height: 10),
                  OrderedProducts(
                    child: (products) => OrderDetailCard(
                        orderModel: orderModel, products: products),
                  ),
                  const SizedBox(height: kBottomNavigationBarHeight),
                  BlocListener<ProductBloc, ProductState>(
                    listener: (_, state) {
                      if (state is ProductLoaded) {
                        Map<String, dynamic> data = {};
                        data.putIfAbsent('products', () => state.addedProducts);
                        data.putIfAbsent(
                            'shipping_charge', () => state.shippingCharge);

                        Navigator.of(context).pushReplacementNamed(
                            CheckoutScreen.tag,
                            arguments: data);
                      }
                    },
                    child: const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomSheet: InkWell(
          onTap: () {
            final state = context.read<OrderBloc>().state;
            context.read<ProductBloc>().add(RepeatOrder(
                products: orderModel
                    .productDetails!, //state is OrderDetailLoaded ? state.products : [],
                shippingCharge: double.tryParse(orderModel.shippingCharge!)!));
          },
          child: Container(
            height: kBottomNavigationBarHeight,
            width: double.infinity,
            color: primaryLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Repeat Order",
                    style: kLabelStyleBold.copyWith(
                        color: secondaryLight, fontSize: 14)),
                const SizedBox(height: 3),
                Text("View kart on next steps",
                    style: kLabelStyle.copyWith(
                        color: secondaryLight, fontSize: 9))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
