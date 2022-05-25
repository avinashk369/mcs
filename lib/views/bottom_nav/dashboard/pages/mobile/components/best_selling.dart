part of home_screen;

class BestSelling extends StatelessWidget {
  BestSelling({Key? key}) : super(key: key);
  int listSize = 6;
  int itemCount = 2;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: .5);
  @override
  Widget build(BuildContext context) {
    int pageCount = (listSize / itemCount).ceil();
    return BlocBuilder<NavigationBloc, int>(builder: (context, state) {
      return SizedBox(
        height: itemCount * 220,
        child: PageView.builder(
          itemCount: pageCount,
          controller: _pageController,
          pageSnapping: false,
          padEnds: false,
          itemBuilder: (BuildContext context, int index) {
            return plateTable(state, itemCount);
          },
          onPageChanged: (int page) {
            context.read<NavigationBloc>().changeNavigation(page);
          },
        ),
      );
    });
  }

  Widget plateTable(int size, int itemCount) => ListView.separated(
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => ((size * itemCount) + 1 + index < 6)
          ? const SizedBox(
              height: 2,
            )
          : const SizedBox.shrink(),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if ((size * itemCount) + index < 6) {
          return const ItemCard(
            height: 220,
          );
        } else {
          return const SizedBox.shrink();
        }
      });
}
