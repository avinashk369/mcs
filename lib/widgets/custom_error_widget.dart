import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, this.imageUrl = "", required this.message, this.onRetry});
  final String imageUrl;
  final String message;
  final Function? onRetry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              errorWidget: (_, __, ___) =>
                  Image.asset('assets/images/logo.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: kLabelStyle.copyWith(color: greyColor),
          ),
          const SizedBox(height: 15),
          onRetry != null
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor.withOpacity(.6)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size(40, 30),
                          splashFactory: NoSplash.splashFactory,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: onRetry!(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            "Retry",
                            style: kLabelStyleBold.copyWith(
                                color: primaryLight, fontSize: 14),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.refresh,
                        color: primaryLight,
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
