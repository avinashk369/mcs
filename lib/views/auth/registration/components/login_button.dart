part of user_auth;

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.mobileNumber,
    required this.isValid,
  }) : super(key: key);
  final String mobileNumber;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is Authorized) {
          Map<String, dynamic> userData = {
            'mobile_no': mobileNumber.substring(3, mobileNumber.length),
            'token': state.authModel.otp
          };
          Navigator.of(context)
              .pushReplacementNamed(UserVerification.tag, arguments: userData);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return SubmitButton(
            isActive: isValid,
            isLoading: (state is UserLoading) ? true : false,
            onTap: () => context.read<UserBloc>().add(
                  UserLoginEvent(
                    mobileNumber:
                        mobileNumber.substring(3, mobileNumber.length),
                  ),
                ),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 25,
            ),
          );
        },
      ),
    );
  }
}
