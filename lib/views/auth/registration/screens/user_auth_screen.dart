library user_auth;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/login/loginbloc.dart';
import 'package:mcs/blocs/user/user_bloc.dart';
import 'package:mcs/resources/user/user_repositoryimpl.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/custom_input.dart';
import 'package:mcs/widgets/responsive_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcs/widgets/themes/config.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'mobile/user_auth.dart';
part '../components/login_button.dart';

part '../components/phone_number.dart';
part '../components/registration_header.dart';
part '../components/tnc.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [Colors.black, Colors.purple],
          // ),
        ),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: currentTheme.currentTheme == ThemeMode.light
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light,
          child: ResponsiveWidgets(
            mobileLayout: MultiBlocProvider(
                providers: [
                  BlocProvider<LoginBloc>(
                    create: (context) => LoginBloc(),
                  ),
                  BlocProvider<UserBloc>(
                    create: (context) =>
                        UserBloc(context.read<UserRepositoryImpl>()),
                  ),
                ],
                child: UserAuth(
                  mobileNumberController: mobileNumberController,
                )),
          ),
        ),
      ),
    );
  }
}
