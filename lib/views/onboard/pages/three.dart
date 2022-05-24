import 'package:mcs/views/auth/registration/screens/user_auth_screen.dart';
import 'package:mcs/views/onboard/widgets/next_page_button.dart';
import 'package:mcs/views/onboard/widgets/ripple.dart';
import 'package:mcs/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mcs/views/ui_test.dart';

class Three extends StatefulWidget {
  final double screenHeight;

  const Three({
    required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _ThreeState createState() => _ThreeState();
}

class _ThreeState extends State<Three> with TickerProviderStateMixin {
  late AnimationController _rippleAnimationController;
  late Animation<double> _rippleAnimation;

  @override
  void initState() {
    super.initState();
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: kRippleAnimationDuration,
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    _rippleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'photo-1566501206188…' (shape)
          Padding(
              padding: EdgeInsets.only(top: 0),
              child: Column(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent, width: 0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "lbl_no_transaction",
                          style: kTitleStyle.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "desc_no_transaction",
                          style: kLabelStyle.copyWith(color: secondaryLight),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: greyColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/grp.png',
                              height: 300,
                            ),
                            NextPageButton(
                              onPressed: () async => await _nextPage(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ])),
          AnimatedBuilder(
            animation: _rippleAnimation,
            builder: (_, Widget? child) {
              return Ripple(
                radius: _rippleAnimation.value,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _nextPage() async {
    await _rippleAnimationController.forward();
    PreferenceUtils.putBool(has_seen, true);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) =>
            const UserAuthScreen())); //EmailSignin()
  }
}
