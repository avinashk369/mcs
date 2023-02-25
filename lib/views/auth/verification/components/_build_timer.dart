part of verification_view;

class BuildTimer extends StatelessWidget {
  const BuildTimer({Key? key, required this.mobile}) : super(key: key);
  final String mobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Didn't receive the code ? "),
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) => state.maybeWhen(
            countDownStrated: (countDown, canResend) => TextButton(
              onPressed: (canResend)
                  ? () {
                      BlocProvider.of<TimerBloc>(context)
                          .validateCountdownResendCode();

                      context.read<UserBloc>().add(ResendOtp(mobile: mobile));
                    }
                  : null,
              child: Text(
                !canResend ? '$countDown' : 'Resend OTP',
                style: kLabelStyleBold.copyWith(
                  color: redColor,
                ),
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
