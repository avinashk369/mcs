part of food_screen;

class FoodFilter extends StatelessWidget implements PreferredSizeWidget {
  const FoodFilter({
    Key? key,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight * 2),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SearchbarPlaceholder(onTap: () {}, hintList: searchHintFood),
        Container(
          height: kToolbarHeight,
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.height * 0.12,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey[50]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "Eat Now",
                          style: kLabelStyleBold.copyWith(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14,
                          ),
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
                activeColor: primaryLight,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.equalizer_rounded,
                  color: greyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  final Size preferredSize;
}
