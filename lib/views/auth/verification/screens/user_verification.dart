library verification_view;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/login/login_bloc.dart';
import 'package:mcs/blocs/login/timer_bloc.dart';
import 'package:mcs/blocs/user/user_bloc.dart';
import 'package:mcs/resources/user/user_repositoryimpl.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/auth/verification/components/button_state.dart';
import 'package:mcs/views/bottom_nav/dashboard/dashboard.dart';
import 'package:mcs/widgets/loading_ui.dart';
import 'package:mcs/widgets/responsive_widgets.dart';
import 'package:mcs/widgets/themes/config.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

part 'mobile/otp_contr.dart';

part 'mobile/otp.dart';
part '../components/_build_small_btn.dart';
part '../components/_build_timer.dart';
part '../components/_image_header.dart';
part '../components/_otp_container.dart';
part '../components/verification_btn.dart';

class UserVerification extends StatefulWidget {
  static const String tag = otpRoute;
  const UserVerification({Key? key, required this.token, required this.mobile})
      : super(key: key);
  final String token;
  final String mobile;

  @override
  _UserVerificationState createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
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
                // BlocProvider<UserBloc>(
                //   create: (context) =>
                //       UserBloc(context.read<UserRepositoryImpl>()),
                // ),
                BlocProvider(
                    create: (context) =>
                        TimerBloc()..validateCountdownResendCode()),
              ],
              child: OtpContr(
                token: widget.token,
                mobile: widget.mobile,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
