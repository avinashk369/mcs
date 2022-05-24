part of user_auth;

class Tnc extends StatelessWidget {
  const Tnc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "termsAgree.tr",
              style: kLabelStyle.copyWith(fontSize: 12),
            ),
            TextSpan(
              text: termsCondition,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // navigate to desired screen
                },
              style: kLabelStyle.copyWith(
                decoration: TextDecoration.underline,
                color: redColor,
                fontSize: 12,
              ),
            ),
            TextSpan(
              text: "and.tr",
              style: kLabelStyle.copyWith(fontSize: 12),
            ),
            TextSpan(
              text: "privacyPolicy.tr",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // navigate to desired screen
                },
              style: kLabelStyle.copyWith(
                color: redColor,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
