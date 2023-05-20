part of checkout_screen;

class CouponWidget extends StatelessWidget {
  const CouponWidget(
      {super.key,
      required this.couponController,
      required this.subTotal,
      required this.onTap});
  final TextEditingController couponController;
  final double subTotal;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomInput(
                        hintText: couponCode,
                        textController: couponController,
                        onChanged: (value) => context
                            .read<CartBloc>()
                            .add(ValidateCoupon(couponCode: value)),
                        validator: (value) =>
                            value!.isEmptyString ? null : invalidCoupon,
                        hintTextStyle: kLabelStyle,
                        maxLength: 6,
                        onTouched: () => () {},
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SubmitButton(
                      isActive: (state is ValidCoupon)
                          ? state.isValid
                          : (state is CartError)
                              ? true
                              : false,
                      isLoading: (state is CartLoading) ? true : false,
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        context.read<CartBloc>().add(
                              ApplyCoupon(
                                  couponCode:
                                      couponController.text.trim().toString(),
                                  userId: PreferenceUtils.getString(user_uid),
                                  subTotal: subTotal),
                            );
                        onTap();
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                if (state is CartError) ...[
                  Text(
                    state.message,
                    style: kLabelStyleBold.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ],
            );
          }),
    );
  }
}
