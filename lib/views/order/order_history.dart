library order_history;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/order/order_bloc.dart';
import 'package:mcs/models/order/order_model.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/order/order_detail_screen.dart';

import '../../resources/order/order_repositoryImpl.dart';
import '../../routes/route_constants.dart';
import '../../widgets/loading_ui.dart';
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
                        ),
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
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
