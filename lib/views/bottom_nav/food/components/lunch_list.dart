part of food_screen;

class LunchList extends StatelessWidget {
  const LunchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lunch",
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
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => const FoodCard(
            imageUrl:
                "https://img.freepik.com/free-photo/tortilla-wrap-with-falafel-fresh-salad-vegan-tacos-vegetarian-healthy-food_2829-6193.jpg?size=338&ext=jpg",
          ),
        )
      ],
    );
  }
}
