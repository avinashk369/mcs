part of order_detail_screen;

class OrderedProducts extends StatelessWidget {
  const OrderedProducts({super.key, required this.child});
  final Function(List<ProductModel> products) child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (previous, current) => current is! ExpandedList,
      builder: (context, state) => state.maybeMap(
        loading: (value) => const LoadingUI(),
        orderDetail: (value) => child(value.products),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
