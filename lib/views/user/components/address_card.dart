import 'package:flutter/material.dart';

import '../../../models/user/user_address.dart';
import '../../../utils/styles.dart';
import '../../../utils/theme_constants.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key, required this.userAddress, required this.onChange});
  final UserAddress userAddress;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: greyColor.withOpacity(.4)),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        addressIcon(userAddress),
                        const SizedBox(width: 5),
                        Text(
                          addressType(userAddress),
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
                      "${userAddress.address!}, ${userAddress.state}, ${userAddress.city}, Pincode: ${userAddress.pincode} ",
                      style: kLabelStyle.copyWith(height: 1.4),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor.withOpacity(.4)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(40, 20),
                  splashFactory: NoSplash.splashFactory,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () => onChange(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "Change",
                    style: kLabelStyleBold.copyWith(color: primaryLight),
                  ),
                ),
              ),
            ),
          ],
        ),
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
