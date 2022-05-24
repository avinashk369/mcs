part of home_screen;

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {Key? key, required this.textController, required this.onSubmitted})
      : super(key: key);
  final TextEditingController textController;
  final Function(String text) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kLabelStyle.copyWith(height: 1.2),
                    autofocus: true,
                    cursorColor: Colors.grey,
                    textAlignVertical: TextAlignVertical.center,
                    onSubmitted: (value) => onSubmitted(value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: 'Search location',
                      hintStyle: kLabelStyle,
                      counter: const Offstage(),
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 0,
                      ),
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
