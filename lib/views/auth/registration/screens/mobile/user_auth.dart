part of user_auth;

class UserAuth extends StatefulWidget {
  const UserAuth({Key? key}) : super(key: key);

  @override
  _UserAuthState createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  final SmsAutoFill _autoFill = SmsAutoFill();

  @override
  void initState() {
    /// here we are getting the phone number value from the dialog
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _autoFill.hint.then((value) {
        // authCon.phoneNumberController.text =
        //     value != null ? value.substring(3, value.length) : "";
        // value != null ? authCon.isValid(true) : authCon.isValid(false);
      });
    });
    print("bloc code init ${context.read<LoginBloc>().hashCode}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const RegistrationHeader(),
        SizedBox(
          height: size.height * .45,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.grey[100],
            ),
            padding: const EdgeInsets.fromLTRB(15, 15, 10, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Please login to continue",
                  style: kLabelStyleBold.copyWith(fontSize: 20),
                ),
                Divider(
                  endIndent: size.width * .60,
                  color: dividerColor,
                  indent: 0,
                  thickness: 2,
                ),
                Text(
                  "",
                  style: kLabelStyle.copyWith(),
                ),
                const SizedBox(
                  height: 35,
                ),
                const PhoneNumber(),
                // Checkbox(
                //   value: true,
                //   onChanged: (value) {},
                // ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Tnc(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
