part of user_auth;

class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.contain,
      ),
    );
    ;
  }
}
