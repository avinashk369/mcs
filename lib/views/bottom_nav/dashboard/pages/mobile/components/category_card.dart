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
    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: onTap,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              child,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kLabelStyleBold.copyWith(
                        //color: secondaryLight,
                        fontSize: 20,
                        letterSpacing: 2,
                        height: 1.5,
                        fontFamily: GoogleFonts.archivoBlack().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
