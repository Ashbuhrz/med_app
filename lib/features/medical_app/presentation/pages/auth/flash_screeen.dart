import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/asset_const.dart';
import 'package:machinetest/config/string_const.dart';
import 'package:machinetest/features/medical_app/data/local/shared_pref.dart';
import 'package:machinetest/features/medical_app/presentation/controllers/auth_controller/auth_controller.dart';
import 'package:machinetest/features/medical_app/presentation/pages/home/home_screen.dart';
import 'login.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  AuthController _userController = Get.put(AuthController());

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image.asset(
              AssetConstant.medicine,
              width: 100,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Med APP',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 1), () async {
      if (StorageUtil().getBool(FIRST_LOGIN) ?? false) {
        _userController.initGetUserId();
        Get.offAll(() => HomeScreen());
      } else {
        Get.to(LoginScreen());
      }
    });
  }
}
