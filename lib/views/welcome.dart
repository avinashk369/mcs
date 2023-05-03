import 'package:mcs/models/models.dart';
import 'package:mcs/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mcs/views/bottom_nav/dashboard/dashboard.dart';

import '../routes/route_constants.dart';
import 'auth/registration/screens/user_auth_screen.dart';

class Welcome extends StatefulWidget {
  static const String tag = homeRoute;
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

    String carts = PreferenceUtils.getString(cartItems);
    print('Avinash cart $carts');
    // print(
    //     "user metadata $userId userId \n $creationTime  creation time \n $lastSignInTime  last sign in time");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userId!.isNotEmpty
            ? const Dashboard()
            : const UserAuthScreen() //UserAuthScreen()
        );
  }
}
