part of verification_view;

class VerificationBtn extends StatelessWidget {
  const VerificationBtn(
      {Key? key,
      required this.isValid,
      required this.otp,
      required this.mobileNumber})
      : super(key: key);
  final bool isValid;
  final int otp;
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (userModel) {
            // PreferenceUtils.putString(accessToken, state.userModel.token!);
            // PreferenceUtils.putInt(mobileNumber, state.userModel.mobile!);
            // PreferenceUtils.putString(user_type, state.userModel.userType!);
            // PreferenceUtils.putString(user_id, state.userModel.id!);

            Navigator.of(context)
                .popAndPushNamed(Dashboard.tag, arguments: userModel.otp);
          },
          orElse: () => {},
        );
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) =>
            otpVerifyBtn(state is UserLoading, otp, context),
      ),
    );
  }

  Widget otpVerifyBtn(bool isLoading, int otp, BuildContext context) =>
      ElevatedButton(
        onPressed: isValid
            ? () {
                context
                    .read<UserBloc>()
                    .add(VerifyOtp(otp: otp, mobileNumber: mobileNumber));
                context.read<TimerBloc>().cancelTimer();
              }
            : null,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(48),
          backgroundColor: isLoading ? Colors.white24 : primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: isLoading
            ? LoadingUI()
            : const FittedBox(child: Text("Verify OTP")),
      );
}
