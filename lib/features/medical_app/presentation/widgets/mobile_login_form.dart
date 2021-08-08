import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/color_const.dart';
import 'package:machinetest/core/util/textfield_validator.dart';
import 'package:machinetest/features/medical_app/presentation/controllers/auth_controller/auth_controller.dart';

import 'custom_button.dart';

class LoginWithMobileTextForm extends StatefulWidget {
  const LoginWithMobileTextForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginWithMobileTextFormState createState() =>
      _LoginWithMobileTextFormState();
}

class _LoginWithMobileTextFormState extends State<LoginWithMobileTextForm> {
  final controller = TextEditingController();
  late String inputMobileNumber;
  late String inputCountryCode = '+1';

  final AuthController _authController = Get.put(AuthController());

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              CountryCodePicker(
                initialSelection: 'US',
                onChanged: (value) {
                  inputCountryCode = value.dialCode!;
                },
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kLightGreyColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: 'Enter Your Mobile Number',
                  ),
                  onChanged: (value) {
                    inputMobileNumber = value;
                  },
                  onSubmitted: (_) {
                    getOtp();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          CustomButton(
            child: Text('Get Otp'),
            onPressed: getOtp,
          )
        ],
      ),
    );
  }

  void getOtp() {
    if (checkFormField(
      forms: [controller],
    )) {
      _authController.verify('$inputCountryCode' + inputMobileNumber);
    } else {
      Get.snackbar('Invalid Fields', 'Please fill valid details');
    }
  }

  void dispatchRandom() {
    controller.clear();
  }
}
