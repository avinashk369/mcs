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
          height: size.height * .25,
          child: PageView.builder(
            itemCount: 5,
            controller: _pageController,
            pageSnapping: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.transparent,
                  child: SizedBox(
                    width: size.width,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOfRqfyUEqLOyKZdjPeMfFrHHDLQgYFxH_9g&usqp=CAU",
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: LoadingUI(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
        ),
        Container(
          height: 20,
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
