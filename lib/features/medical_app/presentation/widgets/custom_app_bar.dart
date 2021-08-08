import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/asset_const.dart';
import 'package:machinetest/config/string_const.dart';
import 'package:machinetest/features/medical_app/data/local/shared_pref.dart';
import 'package:machinetest/features/medical_app/presentation/pages/auth/login.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Image.asset(
          AssetConstant.pills,
          height: 30,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            "Are you sure you want to logout",
                            style: TextStyle(color: Colors.black),
                          ),
                          content: Text(
                              "If you logout, we will not be able to show you customised offers and bill reminders"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  StorageUtil().setBool(FIRST_LOGIN, false);
                                  FirebaseAuth.instance.signOut();
                                  Get.offAll(LoginScreen());
                                },
                                child: Text("Proceed"))
                          ],
                        ));
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.redAccent,
              )),
        )
      ],
      toolbarHeight: 100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
