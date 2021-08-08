import 'package:flutter/material.dart';
import 'package:machinetest/config/asset_const.dart';
import 'package:machinetest/features/medical_app/presentation/widgets/mobile_login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(controller!);
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetConstant.flash_jpg,
            ),
            SizedBox(
              height: 50,
            ),
            SlideTransition(
              position: offset!,
              child: LoginWithMobileTextForm(),
            ),
          ],
        ),
      ),
    ));
  }
}
