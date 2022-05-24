import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';

class BottomSheetLayout extends StatelessWidget {
  const BottomSheetLayout({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          //bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3),
                  ),
                  color: Theme.of(context).hintColor.withOpacity(.12),
                ),
              ),
            ),
            const Spacer(),
            Text(
              message,
              style: kLabelStyleBold.copyWith(
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(.5),
              endIndent: MediaQuery.of(context).size.width * .45,
              thickness: 2,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: null,
              child: const FittedBox(child: Text("Submit")),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(48),
                maximumSize: const Size.fromWidth(150),
                onPrimary: primaryLight,
                primary: secondaryLight,
                //onSurface: purple100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
