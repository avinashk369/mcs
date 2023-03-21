import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/custom_input.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String searchText) onSearch;
  final Function? onTouched;
  final bool readOnly;
  final bool autoFocus;
  const SearchBar({
    Key? key,
    required this.onSearch,
    this.onTouched,
    this.readOnly = false,
    this.autoFocus = false,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
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
                    textController: search,
                    hintText: 'Search products',
                    onChanged: (v) {},
                    readOnly: readOnly,
                    autoFocus: autoFocus,
                    onTouched: () => onTouched!()),
              ),
            ),
            InkWell(
              onTap: () => search.text.isEmpty ? null : onSearch(search.text),
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
