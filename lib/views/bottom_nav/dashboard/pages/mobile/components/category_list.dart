part of home_screen;

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
    required this.categories,
  }) : super(key: key);
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
          addAutomaticKeepAlives: true,
          separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => CategoryCard(
                title: categories[index].name!,
                onTap: () {
                  Map<String, dynamic> data = {
                    "category": categories[index],
                    "index": index
                  };
                  // load products based on cat id
                  Navigator.of(context).pushNamed(products, arguments: data);
                },
                child: CachedNetworkImage(
                  imageUrl: categories[index].thumb!,
                  fit: BoxFit.fill,
                ),
              ),
          itemCount: categories.length),
    );
  }
}
