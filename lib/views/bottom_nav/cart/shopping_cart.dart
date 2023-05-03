import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:mcs/widgets/loading_ui.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newUser = PreferenceUtils.getString(user_type);
    scrollController = ScrollController();
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;
    double total = 0;
    double totalPrice = 0;
    if (state is ProductLoaded) {
      total = ProductUtility.calculatePrice(state.addedProducts!);
      totalPrice = ProductUtility.calculateActualPrice(state.addedProducts!);
    }
    double saved = totalPrice - total;

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
            ElevatedButton(
                onPressed: ((int.tryParse(newUser))! > 0)
                    ? () => Navigator.of(context).pushNamed(CheckoutScreen.tag,
                        arguments: (state is ProductLoaded)
                            ? state.addedProducts ?? [] as List<ProductModel>
                            : [])
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
                child: const Text("Checkout")),
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
                  initial: (_) => LoadingUI(),
                  loaded: (res) =>
                      ShoppingList(addedProducts: res.addedProducts!),
                  error: (err) => Text(err.message),
                  orElse: () => const SizedBox.shrink(),
                ),
                const SizedBox(
                  height: 10,
                ),
                state.maybeMap(
                  initial: (_) => LoadingUI(),
                  loaded: (res) => PriceDetail(products: res.addedProducts!),
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
                      profileUpdated: (value) {
                        Future.delayed(const Duration(seconds: 5), () {
                          Navigator.of(context).pop();
                        });
                      },
                    );
                  }, builder: (context, state) {
                    return state.maybeMap(
                      profileUpdated: (value) => const Text("Profile updated!"),
                      orElse: () => Padding(
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
                                onChanged: (value) {},
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomInput(
                                hintText: "Last Name",
                                maxLength: 50,
                                textController: _lNameController,
                                onTouched: () {},
                                onChanged: (value) {},
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomInput(
                                hintText: "Email",
                                textController: _emailController,
                                onChanged: (value) => {},
                                onTouched: () {},
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
                                            mobileNo: "9540621919",
                                            deviceToken: "token",
                                            deviceType: "android",
                                            email: _emailController.text
                                                .trim()
                                                .toLowerCase(),
                                            firstName:
                                                _fNameController.text.trim(),
                                            lastName:
                                                _lNameController.text.trim());

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
}
