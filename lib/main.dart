import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/color_const.dart';
import 'package:machinetest/config/theme_data.dart';
import 'features/medical_app/data/local/get_initializer.dart';
import 'features/medical_app/presentation/pages/auth/flash_screeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Medicine App',
      theme: ThemeData(
        fontFamily: "Poppins",
        appBarTheme: CustomThemeData.appBarTheme,
        textTheme: CustomThemeData.textTheme,
      ),
      builder: (BuildContext context, Widget? child) {
        EasyLoading.instance
          ..indicatorType = EasyLoadingIndicatorType.ripple
          ..loadingStyle = EasyLoadingStyle.light
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..progressColor = kPrimaryColor
          ..backgroundColor = kSecondaryColor
          ..indicatorColor = Colors.yellow
          ..textColor = Colors.black
          ..maskColor = Colors.blue.withOpacity(0.5)
          ..userInteractions = true;

        return FlutterEasyLoading(
          child: child,
        );
      },
      home: FlashScreen(),
    );
  }
}
