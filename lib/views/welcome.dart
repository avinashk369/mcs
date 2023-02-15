import 'package:mcs/models/models.dart';
import 'package:mcs/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mcs/views/bottom_nav/dashboard/dashboard.dart';

import 'auth/registration/screens/user_auth_screen.dart';
import 'onboard/onboard_screens.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool hasSeen = false;
  String? userId;
  String? creationTime;
  String? lastSignInTime;
  late String authtoken;
  UserModel? userModel;
  @override
  void initState() {
    authtoken = PreferenceUtils.getString(accessToken);
    userId = PreferenceUtils.getString(user_id);
    if (authtoken != '') print(JwtDecoder.parseJwt(authtoken));
    // TODO: implement initState
    hasSeen = PreferenceUtils.getBool(has_seen);
    creationTime = PreferenceUtils.getString(creation_time);
    lastSignInTime = PreferenceUtils.getString(sign_in_time);
    print(
        "user metadata ${userId} userId \n ${creationTime}  creation time \n ${lastSignInTime}  last sign in time");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (hasSeen)
          ? (userId!.isNotEmpty)
              ? const Dashboard(
                  message: "",
                )
              : const UserAuthScreen() //UserAuthScreen() //EmailSingIn()
          : const OnboardScreen(),
    );
  }
}
