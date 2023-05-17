import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';

class LoadingUI extends StatelessWidget {
  final String message;
  const LoadingUI({super.key, this.message = ""});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //decoration: BoxDecoration(border: Border.all()),
      height: MediaQuery.of(context).size.height * .6,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator.adaptive(
            backgroundColor: primaryLight,
            valueColor: AlwaysStoppedAnimation<Color>(greyColor),
            strokeWidth: 2,
          ),
          const SizedBox(height: 10),
          Text(
            "Please wait...We are getting things ready for you",
            style: kLabelStyleBold.copyWith(color: greyColor),
          ),
        ],
      ),
    );
  }
}
