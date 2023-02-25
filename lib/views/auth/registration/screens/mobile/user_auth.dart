part of user_auth;

class UserAuth extends StatefulWidget {
  const UserAuth({Key? key, required this.mobileNumberController})
      : super(key: key);
  final TextEditingController mobileNumberController;

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
        context.read<LoginBloc>().checkNumber(value ?? '');
        widget.mobileNumberController.text =
            value != null ? value.substring(3, value.length) : '';
      });
    });

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
                PhoneNumber(
                    mobileNumberController: widget.mobileNumberController),
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
