library user_address_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcs/blocs/user/user_bloc.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/custom_error_widget.dart';
import 'package:mcs/widgets/loading_ui.dart';

import '../../models/user/user_address.dart';
import '../../widgets/dialog_utility.dart';
part 'components/address_item.dart';
part 'components/address_list.dart';

class UserAddressScreen extends StatefulWidget {
  static const String tag = userAddress;
  const UserAddressScreen({super.key});

  @override
  State<UserAddressScreen> createState() => _UserAddressScreenState();
}

class _UserAddressScreenState extends State<UserAddressScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(
        LoadAddress(data: {"user_id": PreferenceUtils.getString(user_uid)}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved Address",
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => current is AddressLoaded,
                  builder: (context, state) => state.maybeMap(
                    loading: (value) => const LoadingUI(),
                    addressLoaded: (value) =>
                        AddressList(userAddress: value.userAddress),
                    error: (value) => const CustomErrorWidget(
                        imageUrl: "",
                        message: "Something went wrong while fetching address"),
                    orElse: () => const SizedBox.shrink(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet:
          BlocConsumer<UserBloc, UserState>(listener: (context, state) {
        state.mapOrNull(
          error: (error) => Fluttertoast.showToast(msg: error.message),
          addressSaved: (success) {
            context.read<UserBloc>().add(LoadAddress(
                data: {"user_id": PreferenceUtils.getString(user_uid)}));
            Fluttertoast.showToast(
                msg: success.message,
                backgroundColor: greenColor,
                textColor: secondaryLight);
          },
        );
      }, builder: (context, state) {
        return InkWell(
          onTap: () => DialogUtility.addAddress(context, onSubmit: (formData) {
            /// call event to save user address
            context.read<UserBloc>().add(SaveAddress(data: formData));
            Navigator.of(context).pop();
          }),
          child: Container(
            height: kBottomNavigationBarHeight,
            width: double.infinity,
            color: primaryLight,
            child: Center(
              child: Text("Add new address".toUpperCase(),
                  style: kLabelStyleBold.copyWith(
                      fontSize: 14, color: secondaryLight)),
            ),
          ),
        );
      }),
    );
  }
}
