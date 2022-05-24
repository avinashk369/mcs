part of food_screen;

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .18,
      child: Card(
        elevation: 1,
        color: Colors.blueGrey[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: size.width * .45,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.grey[850],
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: kLabelStyleBold.copyWith(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        //fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      children: const [
                        WidgetSpan(
                          child: Icon(Icons.check_box, size: 18),
                        ),
                        WidgetSpan(
                          child: SizedBox(width: 5),
                        ),
                        TextSpan(
                          text:
                              "Lunch name this testing widget and i am fine with the design",
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "840  Cal| High protien ",
                    style: kLabelStyle.copyWith(
                        // fontSize: 16,
                        ),
                  ),
                  Text(
                    "2 serving ",
                    style: kLabelStyle.copyWith(
                        // fontSize: 16,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "\u{20B9}",
                              style: kLabelStyleBold.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: "199",
                              style: kLabelStyleBold.copyWith(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                // fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "\u{20B9}",
                              style: kLabelStyle.copyWith(
                                color: Colors.grey,
                                //fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: "249",
                              style: kLabelStyle.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                // fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Chip(
                        visualDensity: VisualDensity.compact,
                        backgroundColor: Colors.grey[50],
                        label: Text(
                          'ADD',
                          style: kLabelStyleBold.copyWith(
                            color: primaryLight,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
