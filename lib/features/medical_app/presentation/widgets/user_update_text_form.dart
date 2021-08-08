import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/color_const.dart';
import 'package:machinetest/config/string_const.dart';
import 'package:machinetest/core/util/textfield_validator.dart';
import 'package:machinetest/features/medical_app/data/local/shared_pref.dart';
import 'package:machinetest/features/medical_app/presentation/controllers/auth_controller/auth_controller.dart';
import 'package:machinetest/features/medical_app/presentation/pages/home/home_screen.dart';

import 'custom_button.dart';

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  late String inputStr;

  final AuthController _authController = Get.find<AuthController>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            filled: true,
            fillColor: kLightGreyColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: 'Enter Your Name',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            update();
          },
        ),
        SizedBox(height: 16),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: kLightGreyColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: 'Enter Your Name',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            update();
          },
        ),
        Spacer(),
        CustomButton(
          child: Text('Proceed'),
          onPressed: update,
        )
      ],
    );
  }

  void update() {
    if (checkFormField(
        forms: [nameController, emailController],
        emailField: emailController,
        hasEmail: true)) {
      StorageUtil().setBool(FIRST_LOGIN, true);
      StorageUtil().setJSON(USER_ID,
          {'name': nameController.text, 'email': emailController.text});
      _authController.updateUserData(nameController.text, emailController.text);
      Get.to(HomeScreen());
    } else {
      Get.snackbar('Invalid Fields', 'Please fill valid details');
    }
  }
}
