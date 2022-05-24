part of home_screen;

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => CategoryCard(
                title: 'Cat $index',
                onTap: () async {},
                child: CachedNetworkImage(
                  imageUrl: "https://picsum.photos/id/1/200/200",
                  fit: BoxFit.cover,
                ),
              ),
          itemCount: 10),
    );
  }
}
