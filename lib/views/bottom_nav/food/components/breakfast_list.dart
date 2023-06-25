part of food_screen;

class BreakfastList extends StatelessWidget {
  const BreakfastList({Key? key, required this.title, required this.imgUrl})
      : super(key: key);
  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: kLabelStyleBold.copyWith(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  letterSpacing: 2,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // ListView.builder(
        //   padding: EdgeInsets.zero,
        //   itemCount: 5,
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemBuilder: (_, index) => FoodCard(
        //     imageUrl: imgUrl,
        //   ),
        // )
      ],
    );
  }
}
