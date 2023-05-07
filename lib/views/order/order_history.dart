library order_history;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/order/order_bloc.dart';
import 'package:mcs/models/order/order_model.dart';

import '../../resources/order/order_repositoryImpl.dart';
import '../../routes/route_constants.dart';
import '../../utils/app_constants.dart';
import '../../utils/preference_utils.dart';
part './components/order_card.dart';

class OrderHistory extends StatefulWidget {
  static const String tag = orderHistory;
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
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
                      orderLoaded: (value) =>
                          Text(value.order.length.toString()),
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
