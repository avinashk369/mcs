part of food_screen;

class FoodFilter extends StatelessWidget implements PreferredSizeWidget {
  const FoodFilter({
    Key? key,
    required this.searchHint,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight * 2),
        super(key: key);
  final List<String> searchHint;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SearchbarPlaceholder(onTap: () {}, hintList: searchHint),
        Container(
          height: kToolbarHeight,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: foodFilters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) => FilterChip(
                    label: Text(
                      foodFilters.keys.elementAt(index),
                      style: kLabelStyle,
                    ),
                    avatar: foodFilters[foodFilters.keys.elementAt(index)],
                    onSelected: (val) {})),
          ),
        ),
      ],
    );
  }

  @override
  final Size preferredSize;
}
