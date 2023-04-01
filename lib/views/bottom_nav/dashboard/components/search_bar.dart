import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/custom_input.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String searchText) onSearch;
  final Function? onTouched;
  final TextEditingController searchTextController;
  final bool readOnly;
  final bool autoFocus;
  const SearchBar({
    Key? key,
    required this.onSearch,
    this.onTouched,
    this.readOnly = false,
    this.autoFocus = false,
    required this.searchTextController,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Colors.white,
      child: Builder(builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomInput(
                    textController: searchTextController,
                    hintText: 'Search products',
                    onChanged: (v) {},
                    readOnly: readOnly,
                    autoFocus: autoFocus,
                    onTouched: () => onTouched!()),
              ),
            ),
            InkWell(
              onTap: () => searchTextController.text.isEmpty
                  ? null
                  : onSearch(searchTextController.text),
              child: Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: primaryLight,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Icon(
                  Icons.search,
                  color: secondaryLight,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  final Size preferredSize;
}
