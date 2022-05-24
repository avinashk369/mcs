part of food_screen;

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const BreakfastList(
          title: "Breakfast",
          imgUrl:
              "https://img.freepik.com/free-vector/kitchen-top-view-illustration_1284-10106.jpg?size=338&ext=jpg",
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: size.height * .25,
          width: size.width,
          child: CachedNetworkImage(
            imageUrl:
                "https://image.freepik.com/free-photo/delicious-breakfast-meal-composition_23-2148878834.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const LunchList(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: size.height * .25,
          width: size.width,
          child: CachedNetworkImage(
            imageUrl:
                "https://image.freepik.com/free-photo/traditional-uzbek-oriental-cuisine-uzbek-family-table-from-different-dishes-new-year-holiday_127425-162.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const DinnerList(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: size.height * .25,
          width: size.width,
          child: CachedNetworkImage(
            imageUrl:
                "https://image.freepik.com/free-photo/portuguese-baked-eggplants-with-mushrooms_127425-137.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SnacksList(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: size.height * .25,
          width: size.width,
          child: CachedNetworkImage(
            imageUrl:
                "https://image.freepik.com/free-vector/blackboard-background-with-burger_23-2148907814.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
