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
            //PreferenceUtils.putString(accessToken, userModel.token!);
            PreferenceUtils.putString(mobile_number, userModel.mobileNo!);
            PreferenceUtils.putString(user_type, userModel.userType!);
            PreferenceUtils.putString(user_id, userModel.id!);

            Navigator.of(context)
                .popAndPushNamed(Dashboard.tag, arguments: userModel.otp);
          },
          orElse: () => {},
        );
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) => SubmitButton(
          isLoading: state is UserLoading,
          isActive: isValid,
          onTap: () {
            context
                .read<UserBloc>()
                .add(VerifyOtp(otp: otp, mobileNumber: mobileNumber));
            context.read<TimerBloc>().cancelTimer();
          },
          child: const FittedBox(child: Text("Verify OTP")),
        ),
      ),
    );
  }
}
