part of food_screen;

class SnacksList extends StatelessWidget {
  const SnacksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Snacks",
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
                "https://image.freepik.com/free-vector/hand-drawn-fast-food-illustration_23-2149013387.jpg",
          ),
        )
      ],
    );
  }
}
