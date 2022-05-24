import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';

import 'circular_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function notificationLCick;
  final Function imageClick;
  final String title;
  final String subtitle;
  final String uImage;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    required this.notificationLCick,
    required this.title,
    required this.subtitle,
    required this.uImage,
    required this.imageClick,
    this.bottom,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Container(
        margin: const EdgeInsets.all(5),
        child: InkWell(
          onTap: () => imageClick(),
          child: CircularImage(
            imgUrl: uImage,
            height: 30,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: kLabelStyleBold,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.left,
            style: kLabelStyle.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: primaryLight,
          ),
        )
      ],
      automaticallyImplyLeading: true,
      bottom: bottom,
    );
  }

  @override
  final Size preferredSize;
}
