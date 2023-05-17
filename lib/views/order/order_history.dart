library order_history;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/order/order_bloc.dart';
import 'package:mcs/models/order/order_model.dart';
import 'package:mcs/utils/utils.dart';

import '../../resources/order/order_repositoryImpl.dart';
import '../../routes/route_constants.dart';
part './components/order_card.dart';

class OrderHistory extends StatelessWidget {
  static const String tag = orderHistory;
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
                      orderLoaded: (value) => ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.order.length,
                        itemBuilder: (context, index) =>
                            orderDetailCard(value.order[index]),
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

  Widget orderDetailCard(OrderModel orderModel) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: greyColor.withOpacity(.2)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greenColor.withOpacity(.2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: greenColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivered in 16 minutes", style: kLabelStyleBold),
                      const SizedBox(height: 5),
                      Text(
                        "#${orderModel.orderId} - ${DateFormatter.dateToString(DateFormatter.stringToDate(orderModel.orderedAt!))}",
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor.withOpacity(.8),
                  ),
                ],
              ),
            ),
            Divider(color: greyColor.withOpacity(.5)),

            /// product image list
            SizedBox(
              height: 80,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10, //orderModel.productDetails!.length,
                    itemBuilder: ((context, index) => index > 3
                        ? Container(
                            width: MediaQuery.of(context).size.width / 6,
                            decoration: BoxDecoration(
                              color: greyColor.withOpacity(.09),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "+6",
                                style: kLabelStyleBold.copyWith(
                                    fontSize: 20, color: greyColor),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width / 6,
                            child: CachedNetworkImage(
                              imageUrl:
                                  orderModel.productDetails![0].productImage!,
                              fit: BoxFit.cover,
                            ),
                          )),
                    separatorBuilder: (_, __) => const SizedBox(width: 5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: greyColor.withOpacity(.5)),

            /// reorder action
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "Reorder",
                  style: kLabelStyleBold.copyWith(color: primaryLight),
                ),
              ),
            ),
          ],
        ),
      );
}
