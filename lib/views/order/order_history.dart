library order_history;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/order/order_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/models/order/order_model.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/order/order_detail_screen.dart';
import 'package:mcs/widgets/custom_error_widget.dart';

import '../../resources/order/order_repositoryImpl.dart';
import '../../routes/route_constants.dart';
import '../../widgets/loading_ui.dart';
import '../bottom_nav/cart/checkout_screen.dart';
part './components/order_card.dart';

class OrderHistory extends StatelessWidget {
  static const String tag = orderHistory;

  const OrderHistory({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(context.read<OrderRepositoryImpl>())
            ..add(LoadOrder(
                data: {"user_id": PreferenceUtils.getString(user_uid)})),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 10),
                  BlocBuilder<OrderBloc, OrderState>(
                    builder: (context, state) => state.maybeMap(
                      loading: (value) => const LoadingUI(),
                      orderLoaded: (value) => ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.order.length,
                        itemBuilder: (context, index) => OrderCard(
                          orderModel: value.order[index],
                          onTap: (orderModel) => Navigator.of(context)
                              .pushNamed(OrderDetailScreen.tag,
                                  arguments: {'order_model': orderModel}),
                          repeatOrder: (orderModel, products) {
                            context.read<ProductBloc>().add(RepeatOrder(
                                products: products,
                                shippingCharge: double.tryParse(
                                        orderModel.shippingCharge!) ??
                                    0.0));
                          },
                        ),
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                      ),
                      error: (value) => CustomErrorWidget(
                          imageUrl: "", message: value.message),
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ),
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
      ),
    );
  }
}
