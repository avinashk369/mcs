import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/location/location_bloc.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/preference_utils.dart';
import '../../../utils/styles.dart';
import '../../../utils/theme_constants.dart';
import '../views/user/components/address_form.dart';

class DialogUtility {
  /// address bottom sheet dialog
  static void addAddress(BuildContext context,
      {required Function(Map<String, dynamic> data) onSubmit}) {
    Map<String, dynamic> addressMap = {};
    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        context: context,
        builder: (context) {
          final locationState = context.read<LocationBloc>().state;
          // PARAM user_id, first_name, last_name, mobile_no, address, city, state, pincode, latitude, longitude
          /// get the user location detail
          if (locationState is LocationLoaded) {
            addressMap['latitude'] = locationState.locationData.latitude;
            addressMap['longitude'] = locationState.locationData.longitude;
            addressMap['area'] = locationState.address.thoroughfare ?? "";
          }
          addressMap['alt_mobile_no'] =
              PreferenceUtils.getString(mobile_number);
          addressMap['user_id'] = PreferenceUtils.getString(user_uid);
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewInsets.top,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 5,
                  child: Center(
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Address ",
                      style: kLabelStyleBold.copyWith(fontSize: 16)),
                ),
                const SizedBox(
                  height: 20,
                ),
                AddressForm(
                  onSubmit: (data) {
                    addressMap.addAll(data);
                    onSubmit(addressMap);
                  },
                )
              ],
            ),
          );
        });
  }
}
