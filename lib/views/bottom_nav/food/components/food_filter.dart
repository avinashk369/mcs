part of food_screen;

class FoodFilter extends StatelessWidget implements PreferredSizeWidget {
  const FoodFilter({
    Key? key,
    required this.searchHint,
    required this.onFilter,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight * 2),
        super(key: key);
  final List<String> searchHint;
  final Function(String name, int index) onFilter;
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
              itemBuilder: (_, index) =>
                  BlocBuilder<ToggleIndexBloc, IndexToggled>(
                      builder: (context, state) {
                final bool isSelected =
                    (state.isSelected && state.index == index);
                return FilterChip(
                  visualDensity: VisualDensity.compact,
                  label: Text(
                    foodFilters.keys.elementAt(index),
                    style: kLabelStyle,
                  ),
                  backgroundColor: greyColor.withOpacity(.1),
                  shape: StadiumBorder(
                      side: BorderSide(
                          color: isSelected
                              ? redColor
                              : greyColor.withOpacity(.1))),
                  avatar: foodFilters[foodFilters.keys.elementAt(index)],
                  onSelected: (val) {
                    context.read<ToggleIndexBloc>().toggleState(index, false);
                    onFilter(foodFilters.keys.elementAt(index), index);
                  },
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  @override
  final Size preferredSize;
}
