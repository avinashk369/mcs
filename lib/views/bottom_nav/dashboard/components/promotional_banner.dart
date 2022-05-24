part of dashboard;

class PromotionalBanner extends StatefulWidget {
  const PromotionalBanner({Key? key}) : super(key: key);

  @override
  _PromotionalBannerState createState() => _PromotionalBannerState();
}

class _PromotionalBannerState extends State<PromotionalBanner> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  int _currentPage = 0;
  List<Widget> _buildPageIndicator(int limit) {
    List<Widget> list = [];
    for (int i = 0; i < limit; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 6.0,
      width: isActive ? 20.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey[700] : Colors.grey[400],
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * .22,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: 5,
                controller: _pageController,
                pageSnapping: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.transparent,
                      child: SizedBox(
                        width: size.width,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "https://picsum.photos/seed/picsum/200/300",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    // colorFilter: ColorFilter.mode(
                                    //     Colors.purple, BlendMode.colorBurn),
                                  ),
                                ),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const Center(
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.deepPurple,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Spacer(
                                    flex: 4,
                                  ),
                                  SizedBox(
                                    width: size.width * .6,
                                    child: Text(
                                      "promotionModel.title!",
                                      style: kLabelStyleBold.copyWith(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.favorite,
                      size: 18,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: size.width * .8,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent, width: 0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: _buildPageIndicator(5),
          ),
        ),
      ],
    );
  }
}
