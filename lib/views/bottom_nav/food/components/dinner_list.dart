part of food_screen;

class DinnerList extends StatelessWidget {
  const DinnerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Dinner",
                style: kLabelStyleBold.copyWith(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  letterSpacing: 2,
                  fontSize: 22,
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
        //   itemBuilder: (_, index) => const FoodCard(
        //     imageUrl:
        //         "https://img.freepik.com/free-vector/kitchen-top-view-illustration_1284-10106.jpg?size=338&ext=jpg",
        //   ),
        // )
      ],
    );
  }
}
