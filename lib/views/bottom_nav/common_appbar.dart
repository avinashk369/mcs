import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/location/location_bloc.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';

class CommonAppbar extends StatelessWidget {
  const CommonAppbar(
      {super.key,
      required this.onLocationLoaded,
      required this.onPermissionDenied,
      required this.onServiceDisabled});
  final Function(LocationLoaded locationState) onLocationLoaded;
  final Function(PermisssionDenied permissionDenied) onPermissionDenied;
  final Function(ServiceDisabled serviceDisabled) onServiceDisabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
        listener: (context, state) {
      state.maybeMap(
        orElse: () {},
        permissionDenied: (value) => onPermissionDenied(value),
        serviceDisabled: (value) => onServiceDisabled(value),
        loaded: (value) => onLocationLoaded(value),
      );
    }, builder: (context, state) {
      return state.maybeMap(
        loaded: (value) => CustomAppBar(
          title: value.address.locality!,
          isSubtitle: true,
          subtitle:
              '${value.address.thoroughfare!} ${value.address.subLocality!}',
        ),
        error: (error) => Text(error.message),
        orElse: () => const SizedBox.shrink(),
      );
    });
  }
}
