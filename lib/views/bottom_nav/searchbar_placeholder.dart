import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';

class SearchbarPlaceholder extends StatefulWidget
    implements PreferredSizeWidget {
  const SearchbarPlaceholder(
      {Key? key, required this.onTap, required this.hintList})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  final VoidCallback onTap;
  final List<String> hintList;

  @override
  State<SearchbarPlaceholder> createState() => _SearchbarPlaceholderState();

  @override
  final Size preferredSize;
}

class _SearchbarPlaceholderState extends State<SearchbarPlaceholder> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    enlargeCenterPage: false,
                    aspectRatio: 1,
                    height: 46,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: widget.hintList.length > 1,
                    reverse: false,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,

                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.vertical,
                  ),
                  itemCount: widget.hintList.length,
                  itemBuilder: (
                    BuildContext context,
                    int itemIndex,
                    int pageViewIndex,
                  ) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        widget.hintList[itemIndex],
                        maxLines: 1,
                        //overflow: TextOverflow.ellipsis,
                        style: kLabelStyleBold.copyWith(
                            color: greyColor, fontSize: 14),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 48,
              height: 48,
              margin: const EdgeInsets.only(top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: primaryLight,
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Icon(
                Icons.search,
                color: secondaryLight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
