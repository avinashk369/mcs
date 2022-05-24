import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/user/user_bloc.dart';
import 'package:mcs/resources/user/user_repositoryimpl.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/loading_ui.dart';

class UiTest extends StatefulWidget {
  const UiTest({Key? key}) : super(key: key);

  @override
  _UiTestState createState() => _UiTestState();
}

class _UiTestState extends State<UiTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UiTest'),
      ),
      body: BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<UserRepositoryImpl>(context))
              ..add(
                const UserLoginEvent(mobileNumber: "9414562898"),
              ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserLoading) {
                          return LoadingUI();
                        }
                        if (state is UserLoaded) {
                          return Text(
                            "${state.userModel.status.toString()}\n${state.userModel.message}",
                            style: kLabelStyleBold,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
