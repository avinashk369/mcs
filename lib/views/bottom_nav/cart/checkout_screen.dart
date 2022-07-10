import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/cart/price_detail.dart';
import 'package:mcs/widgets/custom_input.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late ScrollController _scrollController;
  double total = 0;
  double totalPrice = 0;
  double saved = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    total = widget.products.fold(0, (sum, product) {
      return sum + product.offerPrice! * product.count;
    });
    totalPrice = widget.products.fold(0, (sum, product) {
      return sum + product.price! * product.count;
    });
    saved = totalPrice - total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      persistentFooterButtons: [
        Builder(builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: showPriceDetail,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₹$total",
                      style: kLabelStyleBold.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                        onPressed: showPriceDetail,
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "View price details",
                          style: kLabelStyleBold.copyWith(color: primaryLight),
                        )),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Place Order",
                  )),
            ],
          );
        }),
      ],
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  margin: EdgeInsets.zero,
                  color: secondaryLight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Deliver to: ",
                                        style: kLabelStyle),
                                    TextSpan(
                                        text: "Avinash,",
                                        style: kLabelStyleBold),
                                    TextSpan(
                                        text: "9540621919",
                                        style: kLabelStyleBold)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Laxmipur ward no 16, Rosera Samastipur",
                                style: kLabelStyle,
                              ),
                            ],
                          ),
                        )),
                        ElevatedButton(
                            onPressed: () => showAddressDialog(context),
                            child: const Text("Change")),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(" ${widget.products.length} Items",
                    style: kLabelStyleBold.copyWith(fontSize: 16)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                  child: ListView.separated(
                      separatorBuilder: (_, __) => const SizedBox(width: 5),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final product = widget.products[index];
                        return SizedBox(
                            height: MediaQuery.of(context).size.height * .15,
                            width: MediaQuery.of(context).size.height * .15,
                            child: CachedNetworkImage(
                              imageUrl: product.thumbnail!,
                              placeholder: (context, url) =>
                                  Image.asset("assets/images/photo.jpg"),
                              errorWidget: (context, url, error) =>
                                  Image.asset("assets/images/photo.jpg"),
                              fit: BoxFit.fitWidth,
                            ));
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "₹$total",
                        style: kLabelStyle.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: greyColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "₹$totalPrice",
                        style: kLabelStyleBold.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "₹$saved saved",
                        style: kLabelStyleBold.copyWith(
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PriceDetail(products: widget.products),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showPriceDetail() => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
  showAddressDialog(BuildContext context) => showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 5,
              child: Center(
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Address ",
                  style: kLabelStyleBold.copyWith(fontSize: 16)),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  children: [
                    CustomInput(
                      hintText: "Name",
                      textController: TextEditingController(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomInput(
                      hintText: "City",
                      textController: TextEditingController(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomInput(
                      hintText: "State",
                      textController: TextEditingController(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomInput(
                      hintText: "Address",
                      textController: TextEditingController(),
                      numOfLines: 3,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Submit"))
                  ],
                ),
              ),
            ),
          ],
        );
      });
}
