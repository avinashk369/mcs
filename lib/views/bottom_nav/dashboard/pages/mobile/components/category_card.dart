part of home_screen;

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.title, required this.onTap, required this.child})
      : super(key: key);
  final String title;
  final Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 0,
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: child,
            ),
          ),
          Text(
            title,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: kLabelStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
