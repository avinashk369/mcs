part of subcat_list;

class SubCatCard extends StatelessWidget {
  const SubCatCard(
      {Key? key,
      required this.subcatModel,
      required this.onTap,
      required this.child,
      required this.index})
      : super(key: key);
  final SubcatModel subcatModel;
  final Function(SubcatModel subcatModel) onTap;
  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleIndexBloc, IndexToggled>(
        builder: (context, state) {
      return InkWell(
        onTap: () => onTap(subcatModel),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          color: state.isSelected && state.index == index
              ? redColor
              : Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                subcatModel.name!,
                style: kLabelStyleBold.copyWith(
                    color: state.isSelected && state.index == index
                        ? secondaryLight
                        : darkColor),
              ),
            ),
          ),
        ),
      );
    });
  }
}
