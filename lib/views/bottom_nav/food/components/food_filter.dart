part of food_screen;

class FoodFilter extends StatelessWidget implements PreferredSizeWidget {
  const FoodFilter({
    Key? key,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: kToolbarHeight,
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.height * 0.14,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[50]),
              child: Row(
                children: [
                  Text(
                    "Eat Now",
                    style: kLabelStyleBold.copyWith(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: primaryLight,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Text("Veg", style: kLabelStyleBold.copyWith(color: Colors.grey)),
          Switch(
            value: true,
            onChanged: (b) {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.equalizer_rounded,
            ),
          ),
        ],
      ),
    );
  }

  @override
  final Size preferredSize;
}
