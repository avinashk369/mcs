part of food_screen;

class FoodBanner extends StatefulWidget {
  const FoodBanner({Key? key}) : super(key: key);

  @override
  _FoodBannerState createState() => _FoodBannerState();
}

class _FoodBannerState extends State<FoodBanner> {
  int _current = 0;
  int itemCount = 3;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              height: 180,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,

              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: itemCount,
            itemBuilder: (
              BuildContext context,
              int itemIndex,
              int pageViewIndex,
            ) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey[850],
                  image: const DecorationImage(
                    image: CachedNetworkImageProvider(
                        "https://image.freepik.com/free-photo/delicious-healthy-asian-food-gray-textured-background-with-copy-space_24972-1024.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: size.width * .45,
                            child: Text(
                              'Dine in & Take away available',
                              style: kLabelStyleBold.copyWith(
                                color: Colors.white,
                                fontSize: 25,
                                letterSpacing: 2,
                                fontFamily: GoogleFonts.oswald().fontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (_, index) => Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                height: 6.0,
                width: _current == index ? 20.0 : 6.0,
                decoration: BoxDecoration(
                  color:
                      _current == index ? Colors.grey[700] : Colors.grey[400],
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: button(
                  Column(
                    children: [
                      Text(
                        "20% MAXCASH",
                        style: kLabelStyleBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Upto 80| Min Order Value 250",
                        style: kLabelStyle.copyWith(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "*T&c apply",
                        style: kLabelStyle.copyWith(
                          fontSize: 5,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Colors.pink,
                  size,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: button(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "20% off ",
                        style: kLabelStyleBold.copyWith(fontSize: 16),
                      ),
                      Text(
                        "refer a friend",
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  Colors.lightBlue,
                  size,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget button(Widget child, Color primary, Size size) => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(size.height * .05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: primary),
        child: child,
      );
}
