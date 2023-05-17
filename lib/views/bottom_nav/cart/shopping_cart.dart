import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/cart/cart_bloc.dart';
import 'package:mcs/blocs/navigation/navigation_bloc.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/blocs/user/user_bloc.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/utils/product_utility.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/cart/checkout_screen.dart';
import 'package:mcs/views/bottom_nav/cart/price_detail.dart';
import 'package:mcs/views/bottom_nav/cart/shopping_list.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';
import 'package:mcs/widgets/custom_input.dart';
import 'package:mcs/widgets/extensions/ext_string.dart';
import 'package:mcs/widgets/loading_ui.dart';
import 'package:mcs/widgets/submit_button.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  late ScrollController scrollController;
  late String newUser;
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _emailController;
  final GlobalKey<FormState> profileKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    newUser = PreferenceUtils.getString(user_type);
    scrollController = ScrollController();
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;
    final cartState = context.watch<CartBloc>().state;
    double total = 0;
    double totalPrice = 0;
    if (state is ProductLoaded) {
      total = ProductUtility.calculatePrice(state.addedProducts!);
      totalPrice = ProductUtility.calculateActualPrice(state.addedProducts!);
    }
    double saved = totalPrice - total;
    if (cartState is ShippingChargeLoaded) {
      total = total + cartState.shippingModel.shippingCharge!;
    }

    return Scaffold(
      persistentFooterButtons: [
        Row(
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
            SubmitButton(
                isActive: true,
                height: 40,
                onTap: ((int.tryParse(newUser))! > 0)
                    ? () {
                        Map<String, dynamic> data = {};
                        data.putIfAbsent(
                            'products',
                            () => (state is ProductLoaded)
                                ? state.addedProducts ??
                                    [] as List<ProductModel>
                                : []);
                        data.putIfAbsent(
                            'shipping_charge',
                            () => (cartState is ShippingChargeLoaded)
                                ? cartState.shippingModel.shippingCharge!
                                : 0.0);

                        Navigator.of(context)
                            .pushNamed(CheckoutScreen.tag, arguments: data);
                      }
                    : () {
                        context.read<UserBloc>().add(const EmptyEvent());
                        _fNameController.clear();
                        _lNameController.clear();
                        _emailController.clear();
                        showProfileDialog(
                          context,
                          onSubmit: (userModel) {
                            context
                                .read<UserBloc>()
                                .add(UpdateProfile(userModel: userModel));
                          },
                        );
                      },
                child: const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text("Checkout"),
                )),
          ],
        )
      ],
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: kToolbarHeight,
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            snap: false,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  children: const [
                    CustomAppBar(
                      title: 'Cart',
                    ),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocListener<ProductBloc, ProductState>(
                  bloc: context.read<ProductBloc>(),
                  listenWhen: (previous, current) {
                    return current is ProductLoaded;
                  },
                  listener: (context, state) => state.mapOrNull(
                    loaded: (value) => (ProductUtility.calculatePrice(
                                value.addedProducts!) >
                            0)
                        ? context.read<CartBloc>().add(
                                LoadShippingCharge(data: {
                              "user_id": PreferenceUtils.getString(user_uid),
                              "amount": total
                            }))
                        : context.read<NavigationBloc>().changeNavigation(0),
                  ),
                  child: const SizedBox.shrink(),
                ),
                const SizedBox(
                  height: 15,
                ),
                // user adderess section to add or edit address
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Card(
                //     margin: EdgeInsets.zero,
                //     color: secondaryLight,
                //     child: Row(
                //       children: [
                //         Expanded(
                //             child: Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 8),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               RichText(
                //                 text: TextSpan(
                //                   children: [
                //                     TextSpan(
                //                         text: "Deliver to: ",
                //                         style: kLabelStyle),
                //                     TextSpan(
                //                         text: "Avinash,",
                //                         style: kLabelStyleBold),
                //                     TextSpan(
                //                         text: "9540621919",
                //                         style: kLabelStyleBold)
                //                   ],
                //                 ),
                //               ),
                //               const SizedBox(
                //                 height: 3,
                //               ),
                //               Text(
                //                 "Laxmipur ward no 16, Rosera Samastipur",
                //                 maxLines: 1,
                //                 softWrap: true,
                //                 overflow: TextOverflow.ellipsis,
                //                 style: kLabelStyle,
                //               ),
                //             ],
                //           ),
                //         )),
                //         ElevatedButton(
                //             onPressed: () => showAddressDialog(context,
                //                     onSubmit: (formData) {
                //                   /// call event to save user address
                //                   context.read<UserBloc>().add(SaveAddress());
                //                   Navigator.of(context).pop();
                //                 }),
                //             child: const Text("Change")),
                //         const SizedBox(width: 10)
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),

                Container(
                    height: kToolbarHeight * .75,
                    decoration: BoxDecoration(
                      color: greenColor.withAlpha(40),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          child: Image.asset(
                            "assets/images/reward.gif",
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "You Saved ₹$saved",
                          style: kLabelStyleBold.copyWith(color: greenColor),
                        ),
                      ],
                    )),

                const SizedBox(
                  height: 10,
                ),
                state.maybeMap(
                  initial: (_) => const LoadingUI(),
                  loaded: (res) =>
                      ShoppingList(addedProducts: res.addedProducts!),
                  error: (err) => Text(err.message),
                  orElse: () => const SizedBox.shrink(),
                ),
                const SizedBox(
                  height: 10,
                ),
                state.maybeMap(
                  initial: (_) => const LoadingUI(),
                  loaded: (res) => PriceDetail(
                    products: res.addedProducts!,
                    shippingCharge: (cartState is ShippingChargeLoaded)
                        ? cartState.shippingModel.shippingCharge!
                        : 0.0,
                  ),
                  error: (err) => Text(err.message),
                  orElse: () => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showPriceDetail() => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

  showProfileDialog(BuildContext context,
          {required Function(UserModel userModel) onSubmit}) =>
      showModalBottomSheet(
          isScrollControlled: true,
          enableDrag: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          context: context,
          builder: (context) {
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
                    child: Text("Complete Profile ",
                        style: kLabelStyleBold.copyWith(fontSize: 16)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<UserBloc, UserState>(listener: (context, state) {
                    state.mapOrNull(
                      profileUpdated: (userModel) {
                        PreferenceUtils.putString(user_name,
                            "${userModel.userModel.firstName} ${userModel.userModel.lastName}");
                        PreferenceUtils.putString(
                            user_uid, userModel.userModel.userId!);
                        Future.delayed(const Duration(seconds: 5), () {
                          Navigator.of(context).pop();
                        });
                      },
                    );
                  }, builder: (context, state) {
                    return state.maybeMap(
                      profileUpdated: (value) => profileCompletedWidget(),
                      orElse: () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          key: profileKey,
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
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomInput(
                                hintText: "Email",
                                textController: _emailController,
                                validator: (value) =>
                                    value!.isValidEmail ? null : emailError,
                                maxLength: 50,
                                textInputType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15)),
                                onPressed: (state is UserLoading)
                                    ? null
                                    : () {
                                        UserModel userModel = UserModel(
                                            cityId: "4",
                                            mobileNo: PreferenceUtils.getString(
                                                mobileNumber),
                                            deviceToken: "token",
                                            deviceType: "android",
                                            email: _emailController.text
                                                .trim()
                                                .toLowerCase(),
                                            firstName:
                                                _fNameController.text.trim(),
                                            lastName:
                                                _lNameController.text.trim());
                                        if (!profileKey.currentState!
                                            .validate()) return;

                                        onSubmit(userModel);
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
                    );
                  }),
                ],
              ),
            );
          });
  Widget profileCompletedWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.check_circle,
            size: 100,
            color: greenColor,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Profile completed successfully!",
            textAlign: TextAlign.center,
            style: kLabelStyleBold.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      );
}
