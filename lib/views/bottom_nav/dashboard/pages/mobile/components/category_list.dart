part of home_screen;

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
    required this.categories,
  }) : super(key: key);
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        CategoryModel category = categories[index];
        return CategoryCard(
          title: category.categoryName!,
          onTap: () {
            Map<String, dynamic> data = {
              "category": category,
              "city_id": "4",
              'index': index
            };
            context
                .read<SubcatBloc>()
                .add(SubcatEvent.loadsubcat(catId: category.id!, cityId: "4"));
            context.read<ProductBloc>().add(
                ProductEvent.loadProduct(cityId: '4', categoryId: category.id));
            Navigator.of(context).pushNamed(ProductList.tag, arguments: data);
          },
          child: CachedNetworkImage(
            imageUrl: category.categoryImg ?? '',
            fit: BoxFit.fill,
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 8,
        childAspectRatio: .7,
      ),
    ).horizontalPadding(5);
  }
}
