part of user_address_screen;

class AddressList extends StatelessWidget {
  const AddressList({super.key, required this.userAddress});
  final List<UserAddress> userAddress;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (_, index) => AddressItem(
              userAddress: userAddress[index],
              onTap: (val, address) => action(context, val, address),
            ),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: userAddress.length);
  }

  void action(BuildContext context, String value, UserAddress address) {
    switch (value) {
      // case 'Edit':
      //   DialogUtility.addAddress(
      //     context,
      //     onSubmit: (formData) {
      //       /// call event to save user address
      //       context.read<UserBloc>().add(SaveAddress(data: formData));
      //       Navigator.of(context).pop();
      //     },
      //     preSet: {
      //       'f_name': address.firstName,
      //       'l_name': address.lastName,
      //       'mobile': address.mobileNumber,
      //       'address': address.address,
      //       'state': address.state,
      //       'city': address.city,
      //       'pin_code': address.pincode,
      //     },
      //   );
      //   break;
      case 'Default':
        context.read<UserBloc>().add(SetDefaultAddress(data: {
              "user_id": PreferenceUtils.getString(user_uid),
              "address_id": address.deliveryAddressId
            }));
        break;
      default:
    }
  }
}
