library checkout_screen;

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcs/blocs/cart/cart_bloc.dart';
import 'package:mcs/blocs/location/location_bloc.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/utils/product_utility.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/cart/price_detail.dart';
import 'package:mcs/widgets/custom_input.dart';
import 'package:mcs/widgets/extensions/ext_string.dart';
import 'package:mcs/widgets/loading_ui.dart';

import '../../../blocs/user/user_bloc.dart';
import '../../../resources/cart/cart_repositoryImpl.dart';
import '../../../routes/route_constants.dart';
import '../../../widgets/submit_button.dart';
part 'coupon_widget.dart';

class CheckoutScreen extends StatefulWidget {
  static const String tag = checkout;
  const CheckoutScreen(
      {Key? key, required this.products, this.shippingCharge = 0.0})
      : super(key: key);
  final List<ProductModel> products;
  final double shippingCharge;

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
  late TextEditingController _couponController;
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  late String userId;
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
    _couponController = TextEditingController();
    super.initState();
    _scrollController = ScrollController();
    total = ProductUtility.calculatePrice(widget.products);
    totalPrice = ProductUtility.calculateActualPrice(widget.products);
    saved = totalPrice - total;
    userId = PreferenceUtils.getString(user_uid);
    if (userId.isNotEmpty) {
      context.read<UserBloc>().add(LoadAddress(data: {"user_id": userId}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(
            cartRepositoryImpl: context.read<CartRepositoryImpl>(),
          ),
        ),
      ],
      child: Scaffold(
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
                        "₹${total + widget.shippingCharge}",
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
                            style:
                                kLabelStyleBold.copyWith(color: primaryLight),
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
                  BlocBuilder<UserBloc, UserState>(
                      buildWhen: (previous, current) {
                    return current is AddressLoaded;
                  }, builder: (context, state) {
                    if (state is AddressLoaded) {
                      return addressCard(state.userAddress.last);
                    }
                    return const SizedBox.shrink();
                  }),
                  BlocConsumer<UserBloc, UserState>(listener: (context, state) {
                    state.mapOrNull(
                      error: (error) =>
                          Fluttertoast.showToast(msg: error.message),
                      addressSaved: (success) {
                        context
                            .read<UserBloc>()
                            .add(LoadAddress(data: {"user_id": userId}));
                        Fluttertoast.showToast(
                            msg: success.message,
                            backgroundColor: greenColor,
                            textColor: secondaryLight);
                      },
                    );
                  }, builder: (context, state) {
                    return state.maybeMap(
                      //loading: (value) => LoadingUI(),
                      orElse: () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SubmitButton(
                            isActive: true,
                            onTap: () => showAddressDialog(context,
                                    onSubmit: (formData) {
                                  /// call event to save user address
                                  context
                                      .read<UserBloc>()
                                      .add(SaveAddress(data: formData));
                                  Navigator.of(context).pop();
                                }),
                            child: Text("Add new address".toUpperCase(),
                                style: kLabelStyleBold.copyWith(
                                    fontSize: 14, color: secondaryLight))),
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                  Text(" ${widget.products.length} Items",
                      style: kLabelStyleBold.copyWith(fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
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
                                height:
                                    MediaQuery.of(context).size.height * .15,
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
                  PriceDetail(
                    products: widget.products,
                    shippingCharge: widget.shippingCharge,
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Apply Coupon",
                      style: kLabelStyleBold.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CouponWidget(
                    couponController: _couponController,
                    subTotal: ProductUtility.calculatePrice(widget.products),
                    onTap: () => showPriceDetail(),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addressCard(UserAddress userAddress) => Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: greyColor.withOpacity(.4)),
            borderRadius: BorderRadius.circular(4)),
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
                    Row(
                      children: [
                        const Icon(Icons.home),
                        const SizedBox(width: 5),
                        Text(
                          "Home",
                          style: kLabelStyleBold.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          //TextSpan(text: "Deliver to: \n", style: kLabelStyle),
                          TextSpan(
                              text:
                                  "${userAddress.firstName!.trim()} ${userAddress.lastName}",
                              style: kLabelStyleBold),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Mobile: ", style: kLabelStyle),
                          TextSpan(
                              text: userAddress.mobileNumber,
                              style: kLabelStyleBold)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${userAddress.homeNo!},${userAddress.street ?? userAddress.society},${userAddress.area}, ${userAddress.landmark}, ${userAddress.city}, Pincode: ${userAddress.pincode} ",
                      style: kLabelStyle.copyWith(height: 1.4),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      );

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
              addressMap['area'] = locationState.address.thoroughfare ?? "";
            }
            addressMap['alt_mobile_no'] =
                PreferenceUtils.getString(mobile_number);
            addressMap['user_id'] = PreferenceUtils.getString(user_uid);
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
                      key: addressKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomInput(
                            hintText: "First Name",
                            maxLength: 50,
                            textController: _fNameController,
                            validator: (value) =>
                                value!.isEmptyString ? null : invalidFName,
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
                            validator: (value) =>
                                value!.isEmptyString ? null : invalidLName,
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
                            validator: (value) =>
                                value!.isValidPhone ? null : phoneError,
                            textInputType: TextInputType.phone,
                            maxLength: 10,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "House No",
                            maxLength: 100,
                            textController: _houseNoController,
                            onChanged: (value) => addressMap['home_no'] = value,
                            validator: (value) =>
                                value!.isEmptyString ? null : invalidHouseNo,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Society",
                            textController: _societyController,
                            validator: (value) =>
                                value!.isEmptyString ? null : invalidSociety,
                            onChanged: (value) => addressMap['society'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Street",
                            maxLength: 100,
                            textController: _streetController,
                            validator: (value) =>
                                value!.isEmptyString ? null : invalidStreet,
                            onChanged: (value) => addressMap['street'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Landmark",
                            maxLength: 50,
                            textController: _landmarkController,
                            validator: (value) =>
                                value!.isEmptyString ? null : invalidLandmark,
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
                            validator: (value) =>
                                value!.isEmptyString ? null : invalidCity,
                            onChanged: (value) => addressMap['city'] = value,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomInput(
                            hintText: "Pincode",
                            textController: _pincodeController,
                            textInputType: TextInputType.phone,
                            validator: (value) =>
                                value!.isEmptyString ? null : invalidPincode,
                            onChanged: (value) => addressMap['pincode'] = value,
                            maxLength: 6,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15)),
                            onPressed: () {
                              if (!addressKey.currentState!.validate()) return;
                              onSubmit(addressMap);
                            },
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
