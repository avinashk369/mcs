import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcs/blocs/location/location_bloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/product_utility.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/cart/price_detail.dart';
import 'package:mcs/widgets/custom_input.dart';
import 'package:mcs/widgets/loading_ui.dart';

import '../../../blocs/user/user_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late ScrollController _scrollController;
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _mobileController;
  late TextEditingController _houseNoController;
  late TextEditingController _societyController;
  late TextEditingController _streetController;
  late TextEditingController _landmarkController;
  late TextEditingController _cityController;
  late TextEditingController _pincodeController;
  double total = 0;
  double totalPrice = 0;
  double saved = 0;
  Map<String, dynamic> addressMap = {};
  @override
  void initState() {
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _mobileController = TextEditingController();
    _houseNoController = TextEditingController();
    _societyController = TextEditingController();
    _streetController = TextEditingController();
    _landmarkController = TextEditingController();
    _cityController = TextEditingController();
    _pincodeController = TextEditingController();
    super.initState();
    _scrollController = ScrollController();
    total = ProductUtility.calculatePrice(widget.products);
    totalPrice = ProductUtility.calculateActualPrice(widget.products);
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
                        BlocConsumer<UserBloc, UserState>(
                            listener: (context, state) {
                          state.mapOrNull(
                            error: (error) =>
                                Fluttertoast.showToast(msg: error.message),
                            addressSaved: (success) =>
                                Fluttertoast.showToast(msg: success.message),
                          );
                        }, builder: (context, state) {
                          return state.maybeMap(
                            loading: (value) => LoadingUI(),
                            orElse: () => ElevatedButton(
                              onPressed: () => showAddressDialog(context,
                                  onSubmit: (formData) {
                                /// call event to save user address
                                context
                                    .read<UserBloc>()
                                    .add(SaveAddress(data: formData));
                                Navigator.of(context).pop();
                              }),
                              child: const Text("Change"),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(" ${widget.products.length} Items",
                    style: kLabelStyleBold.copyWith(fontSize: 16)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      separatorBuilder: (_, __) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            width: 1,
                            color: greyColor.withOpacity(.6),
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final product = widget.products[index];
                        return Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.height * .15,
                              child: CachedNetworkImage(
                                imageUrl: product.productImage!,
                                placeholder: (context, url) =>
                                    Image.asset("assets/images/photo.jpg"),
                                errorWidget: (context, url, error) =>
                                    Image.asset("assets/images/photo.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: redColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      product.count.toString(),
                                      style: kLabelStyleBold.copyWith(
                                        color: secondaryLight,
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        );
                      }),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "₹$total",
                        style: kLabelStyleBold.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "₹$totalPrice",
                        style: kLabelStyle.copyWith(
                          decoration: TextDecoration.lineThrough,
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
                const SizedBox(height: 20),
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
  showAddressDialog(BuildContext context,
          {required Function(Map<String, dynamic>) onSubmit}) =>
      showModalBottomSheet(
          isScrollControlled: true,
          enableDrag: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          context: context,
          builder: (context) {
            final locationState = context.read<LocationBloc>().state;

            /// get the user location detail
            if (locationState is LocationLoaded) {
              addressMap['latitude'] = locationState.locationData.latitude;
              addressMap['longitude'] = locationState.locationData.longitude;
              addressMap['area'] = locationState.address.thoroughfare;
            }
            addressMap['alt_mobile_no'] = '1234567890';
            addressMap['user_id'] = '12345';
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).viewInsets.top,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomInput(
                            hintText: "First Name",
                            maxLength: 50,
                            textController: _fNameController,
                            onTouched: () {},
                            onChanged: (value) =>
                                addressMap['first_name'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Last Name",
                            maxLength: 50,
                            textController: _lNameController,
                            onTouched: () {},
                            onChanged: (value) =>
                                addressMap['last_name'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Mobile",
                            textController: _mobileController,
                            onChanged: (value) =>
                                addressMap['mobile_no'] = value,
                            onTouched: () {},
                            textInputType: TextInputType.phone,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "House No",
                            maxLength: 100,
                            textController: _houseNoController,
                            onChanged: (value) => addressMap['home_no'] = value,
                            onTouched: () {},
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Society (Optional)",
                            textController: _societyController,
                            onTouched: () {},
                            onChanged: (value) => addressMap['society'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Street",
                            maxLength: 100,
                            textController: _streetController,
                            onTouched: () {},
                            onChanged: (value) => addressMap['street'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Landmark",
                            maxLength: 50,
                            textController: _landmarkController,
                            onTouched: () {},
                            onChanged: (value) =>
                                addressMap['landmark'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "City",
                            maxLength: 20,
                            textController: _cityController,
                            onTouched: () {},
                            onChanged: (value) => addressMap['city'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Pincode",
                            textController: _pincodeController,
                            textInputType: TextInputType.phone,
                            onTouched: () {},
                            onChanged: (value) => addressMap['pincode'] = value,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15)),
                            onPressed: () => onSubmit(addressMap),
                            child: Text(
                              "Submit".toUpperCase(),
                              style: kLabelStyleBold.copyWith(
                                  fontSize: 18, color: secondaryLight),
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
}
