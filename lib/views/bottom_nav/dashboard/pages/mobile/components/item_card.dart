part of home_screen;

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: Stack(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              color: Colors.grey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3)),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: "https://picsum.photos/250?image=9",
                        placeholder: (context, url) =>
                            Image.asset("assets/images/photo.jpg"),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/photo.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Random text",
                    style: kLabelStyleBold,
                  ),
                  Text(
                    "size - 1Kg",
                    style: kLabelStyleBold,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "₹250",
                            style: kLabelStyleBold.copyWith(
                              fontSize: 12,
                            )),
                        TextSpan(
                            text: "₹300",
                            style: kLabelStyleBold.copyWith(
                                fontSize: 10,
                                color: greyColor,
                                decoration: TextDecoration.lineThrough)),
                      ])),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              left: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 20,
                decoration: const BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3)),
                ),
                child: Center(
                  child: Text("10% Off",
                      style: kLabelStyle.copyWith(color: secondaryLight)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
