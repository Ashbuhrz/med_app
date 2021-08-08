import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/color_const.dart';
import 'package:machinetest/features/medical_app/presentation/controllers/auth_controller/auth_controller.dart';
import 'package:machinetest/features/medical_app/presentation/widgets/user_update_text_form.dart';

class UserDataUpdate extends StatefulWidget {
  @override
  State createState() => UserDataUpdateState();
}

class UserDataUpdateState extends State<UserDataUpdate> {
  AuthController userController = Get.find<AuthController>();
  bool hasError = false;
  TextEditingController userName = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Enter your Name and Email",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 8,
          ),
          Text("Hi there, Let's start with adding your Name and Email",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.subtitle1),
          SizedBox(
            height: 24,
          ),
          Expanded(child: UserInfoForm()),
        ],
      ),
    ));
  }
}
