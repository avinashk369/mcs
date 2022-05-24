part of verification_view;

class VerificationBtn extends StatelessWidget {
  const VerificationBtn(
      {Key? key,
      required this.isValid,
      required this.otp,
      required this.token,
      required this.mobileNumber})
      : super(key: key);
  final bool isValid;
  final String otp;
  final String token;
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          PreferenceUtils.putString(accessToken, state.userModel.token!);
          PreferenceUtils.putInt(mobileNumber, state.userModel.mobile!);
          PreferenceUtils.putString(user_type, state.userModel.userType!);
          PreferenceUtils.putString(user_id, state.userModel.id!);

          Navigator.of(context).popAndPushNamed(dashboardRoute,
              arguments: state.userModel.token!);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return otpVerifyBtn(true, otp, context);
          }
          return otpVerifyBtn(false, otp, context);
        },
      ),
    );
  }

  Widget otpVerifyBtn(bool isLoading, String otp, BuildContext context) =>
      ElevatedButton(
        onPressed: isValid
            ? () {
                context.read<UserBloc>().add(
                    VerifyOtp(otp: otp, token: token, mobile: mobileNumber));
                context.read<TimerBloc>().cancelTimer();
              }
            : null,
        child: isLoading
            ? LoadingUI()
            : const FittedBox(child: Text("Verify OTP")),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(48),
          // onPrimary: primaryLight,
          primary: isLoading ? Colors.white24 : primaryLight,
          //onSurface: purple100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      );
}
