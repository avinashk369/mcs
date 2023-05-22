part of user_address_screen;

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.userAddress});
  final UserAddress userAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: greyColor.withOpacity(.2))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greyColor.withOpacity(.1),
            ),
            child: Center(child: addressIcon(userAddress)),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: addressType(userAddress), style: kLabelStyleBold),
                    const WidgetSpan(
                      child: SizedBox(width: 8),
                    ),
                    TextSpan(
                      text:
                          userAddress.isDefault == "0" ? "Current address" : "",
                      style: kLabelStyleBold.copyWith(
                          color: primaryLight, fontSize: 9),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${userAddress.address!}, ${userAddress.pincode!}",
                style: kLabelStyle,
              )
            ],
          ),
          const Spacer(),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            color: secondaryLight,
            elevation: 1,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                Icons.more_vert,
                color: greyColor,
              ),
            ),
            onSelected: (value) {},
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  value: 'Edit',
                  child: Text(
                    "Edit",
                    style: kLabelStyle,
                  ),
                ),
                PopupMenuItem(
                  value: 'Default',
                  child: Text(
                    "Set as default",
                    style: kLabelStyle,
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }

  Widget addressIcon(UserAddress userAddress) {
    switch (userAddress.addressType) {
      case "0":
        return const Icon(Icons.home_rounded, color: primaryLight);
      case "1":
        return const Icon(Icons.home_work_rounded, color: primaryLight);
      default:
        return const Icon(Icons.home_rounded, color: primaryLight);
    }
  }

  String addressType(UserAddress userAddress) {
    switch (userAddress.addressType) {
      case "0":
        return "Home";
      case "1":
        return "Office";
      default:
        return "Home";
    }
  }
}
