part of subcat_list;

class SubCatCard extends StatelessWidget {
  const SubCatCard(
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
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0,
            color: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: SizedBox(
              height: 50,
              width: 50,
              child: child,
            ),
          ),
          Text(
            title,
            style: kLabelStyle.copyWith(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
