import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/color_const.dart';
import 'package:machinetest/features/medical_app/presentation/controllers/auth_controller/auth_controller.dart';
import 'package:machinetest/features/medical_app/presentation/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  @override
  State createState() {
    return OTPScreenState();
  }
}

class OTPScreenState extends State<OTPScreen> {
  final AuthController _userController = Get.find();

  bool hasError = false;
  var onTapRecognizer;
  TextEditingController otpController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;

  late String currentText = '';
  late Timer _timer;
  int _start = 15;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(
            flex: 2,
          ),
          Text(
            'Enter OTP',
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: kPrimaryColor),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 8,
          ),
          Text('Enter the OTP number\nsent to your mobile number',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.subtitle1),
          Spacer(
            flex: 6,
          ),
          PinCodeTextField(
            appContext: context,
            length: 6,
            boxShadows: [BoxShadow(color: kLightGreyColor)],
            textStyle: Theme.of(context).textTheme.headline4,
            keyboardType: TextInputType.phone,
            showCursor: false,
            errorAnimationController: errorController,
            errorTextSpace: 25,
            validator: (v) {
              if (!v!.isNum) {
                return '   Invalid Character';
              } else {
                return null;
              }
            },
            onChanged: (value) {
              setState(() {
                currentText = value;
              });
            },
            pinTheme: PinTheme.defaults(
                // fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                fieldWidth: 50,
                shape: PinCodeFieldShape.box,
                inactiveColor: Colors.white,
                activeColor: kPrimaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              hasError ? '*Invalid OTP' : '',
              style: TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          Spacer(
            flex: 6,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                if (_start == 0) _userController.resend();
              },
              child: Text('Resend OTP ' '($_start)',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          Spacer(
            flex: 1,
          ),

          Center(
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Change Number',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          //
          Spacer(
            flex: 1,
          ),

          CustomButton(
            child: Text('Get Otp'),
            onPressed: () {
              if (currentText.length != 6 || !currentText.isNum) {
                errorController.add(ErrorAnimationType
                    .shake); // Triggering error shake animation
                setState(() {
                  hasError = true;
                });
              } else {
                setState(() {
                  hasError = false;
                  _userController.manualVerification(currentText);
                });
              }
            },
          ),
        ],
      ),
    ));
  }
}
