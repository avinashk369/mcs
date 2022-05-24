part of verification_view;

class Otp extends StatefulWidget {
  const Otp({
    Key? key,
  }) : super(key: key);
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool isAnimating = true;

  ButtonState state = ButtonState.init;

  _OtpState();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final isStretched = isAnimating || state == ButtonState.init;
    print("$isAnimating is streched $isStretched and the state is $state");
    final isDone = state == ButtonState.done;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              onEnd: () => setState(() {
                print("animating");
                isAnimating = !isAnimating;
              }),
              width: state == ButtonState.init ? width : 100,
              child: isStretched ? buildButton() : buildSmallButton(isDone),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.green : Colors.deepPurple;
    return Container(
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: isDone
              ? const Icon(
                  Icons.done,
                  size: 52,
                  color: Colors.white,
                )
              : const CircularProgressIndicator(
                  color: Colors.white,
                ),
        ));
  }

  Widget buildButton() => ElevatedButton(
        onPressed: () async {
          //verifyOtp();
          setState(() => state = ButtonState.loading);
          await Future.delayed(const Duration(seconds: 2));
          setState(() => state = ButtonState.done);
          await Future.delayed(const Duration(seconds: 2));
          setState(() => state = ButtonState.init);
        },
        child: const FittedBox(child: Text("Verify OTP")),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(48),
          onPrimary: primaryLight,
          primary: secondaryLight,
          //onSurface: purple100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      );
}
