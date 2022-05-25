part of home_screen;

class FreshVeg extends StatelessWidget {
  const FreshVeg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (_, __) => const SizedBox(
              width: 5,
            ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => VegCard(
              height: 150,
              width: double.infinity,
              offer: "5% Off",
              addToCart: (msg) {
                print(msg);
              },
            ),
        itemCount: 5);
  }
}
