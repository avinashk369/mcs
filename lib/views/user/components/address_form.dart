import 'package:flutter/material.dart';
import 'package:mcs/widgets/extensions/ext_string.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_input.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key, required this.onSubmit, required this.preset});
  final Function(Map<String, dynamic> data) onSubmit;
  final Map<String, dynamic> preset;

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _mobileController;
  late TextEditingController _addressController;
  late TextEditingController _stateController;
  late TextEditingController _cityController;
  late TextEditingController _pincodeController;
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  Map<String, dynamic> addressMap = {};

  @override
  void initState() {
    _fNameController = TextEditingController(
        text: widget.preset.isNotEmpty ? widget.preset['f_name'] : null);
    _lNameController = TextEditingController(
        text: widget.preset.isNotEmpty ? widget.preset['l_name'] : null);
    _mobileController = TextEditingController(
        text: widget.preset.isNotEmpty ? widget.preset['mobile'] : null);
    _addressController = TextEditingController(
        text: widget.preset.isNotEmpty ? widget.preset['address'] : null);
    _stateController = TextEditingController(
        text: widget.preset.isNotEmpty ? widget.preset['state'] : null);
    _cityController = TextEditingController(
        text: widget.preset.isNotEmpty ? widget.preset['city'] : null);
    _pincodeController = TextEditingController(
        text: widget.preset.isNotEmpty ? widget.preset['pin_code'] : null);

    super.initState();
  }

  void clearTextController() {
    _fNameController.clear();
    _lNameController.clear();
    _mobileController.clear();
    _addressController.clear();
    _stateController.clear();
    _cityController.clear();
    _pincodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: addressKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomInput(
              hintText: "First Name",
              maxLength: 50,
              textController: _fNameController,
              validator: (value) => value!.isEmptyString ? null : invalidFName,
              onChanged: (value) => addressMap['first_name'] = value,
              onTouched: () => () {},
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
              hintText: "Last Name",
              maxLength: 50,
              textController: _lNameController,
              validator: (value) => value!.isEmptyString ? null : invalidLName,
              onChanged: (value) => addressMap['last_name'] = value,
              onTouched: () => () {},
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
              hintText: "Mobile",
              textController: _mobileController,
              onChanged: (value) => addressMap['mobile_no'] = value,
              validator: (value) => value!.isValidPhone ? null : phoneError,
              textInputType: TextInputType.phone,
              maxLength: 10,
              onTouched: () => () {},
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
              hintText: "Complete Address",
              maxLength: 100,
              textController: _addressController,
              numOfLines: 4,
              textInputType: TextInputType.multiline,
              onChanged: (value) => addressMap['address'] = value,
              validator: (value) =>
                  value!.isEmptyString ? null : invalidAddress,
              onTouched: () => () {},
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
              hintText: "City",
              maxLength: 20,
              textController: _cityController,
              validator: (value) => value!.isEmptyString ? null : invalidCity,
              onChanged: (value) => addressMap['city'] = value,
              onTouched: () => () {},
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
              hintText: "State",
              textController: _stateController,
              validator: (value) => value!.isEmptyString ? null : invalidState,
              onChanged: (value) => addressMap['state'] = value,
              onTouched: () => () {},
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInput(
              hintText: "Pincode",
              textController: _pincodeController,
              textInputType: TextInputType.phone,
              validator: (value) =>
                  value!.isEmptyString ? null : invalidPincode,
              onChanged: (value) => addressMap['pincode'] = value,
              maxLength: 6,
              onTouched: () => () {},
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15)),
              onPressed: () {
                if (!addressKey.currentState!.validate()) return;
                widget.onSubmit(addressMap);
              },
              child: Text(
                "Submit".toUpperCase(),
                style: kLabelStyleBold.copyWith(
                    fontSize: 18, color: secondaryLight),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
