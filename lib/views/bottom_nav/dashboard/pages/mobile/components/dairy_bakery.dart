part of home_screen;

class DairyBakery extends StatelessWidget {
  const DairyBakery({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => ProductCard(
                height: 220,
                width: 150,
                hasOffer: true,
                offer: "5% Off",
                addToCart: (msg) {
                  print(msg);
                },
              ),
          itemCount: 10),
    );
  }
}
