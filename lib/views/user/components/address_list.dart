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
        itemBuilder: (_, index) => AddressItem(userAddress: userAddress[index]),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: userAddress.length);
  }
}
