import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/string_const.dart';
import 'package:machinetest/features/medical_app/data/local/shared_pref.dart';
import 'package:machinetest/features/medical_app/presentation/pages/auth/otp_screen.dart';
import 'package:machinetest/features/medical_app/presentation/pages/auth/user_update.dart';
import 'auth_state.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final userState = UserState();

  Future initGetUserId() async {
    userState.userId.value = StorageUtil().getString(USER_ID)!;
    userState.userName.value = StorageUtil().getJSON(USER_ID)!['name'];
    userState.userEmail.value = StorageUtil().getJSON(USER_ID)!['email'];
  }

  updateUserData(String name, String email) {
    userState.userName.value = name;
    userState.userEmail.value = email;
  }

  Future verify(String phoneNumber) async {
    print('verify called');
    EasyLoading.show();
    userState.phoneNumber.value = phoneNumber;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: onCodeSent,
      timeout: Duration(minutes: 2),
      codeAutoRetrievalTimeout: autoRetrievalTimeOut,
    );
  }

  Future manualVerification(String userEnteredOtp) async {
    //manually entering otp
    print('verify-manual called');
    EasyLoading.show();
    // Create a PhoneAuthCredential with the code
    var phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: userState.verificationId.value,
        smsCode: userEnteredOtp);
    // Sign the user in (or link) with the credential
    try {
      await _auth.signInWithCredential(phoneAuthCredential).then((value) {
        print(value);
        if (value.user != null) //screens.login success full
        {
          //checkWeather user exist or is a new user
          tryLogin(); //login with our server
        }
      });
    } on FirebaseAuthException catch (error, exp) {
      EasyLoading.dismiss();
      switch (error.code) {
        case 'invalid-verification-code':
          userState.msg.value = 'Invalid SMS Code';
          EasyLoading.showError(userState.msg.value);
          break;
        default:
          userState.msg.value = error.message!;
          EasyLoading.showError(userState.msg.value);
          break;
      }
    }
  }

  void resend() async {
    print('resend called');
    userState.isLoading.value = true;
    userState.msg.value = 'Code Resent';
    await _auth.verifyPhoneNumber(
        timeout: Duration(minutes: 2),
        phoneNumber: userState.phoneNumber.value,
        verificationCompleted: verificationCompleted,
        codeSent: onCodeSent,
        verificationFailed: verificationFailed,
        forceResendingToken: userState.resendToken.value,
        codeAutoRetrievalTimeout: autoRetrievalTimeOut);
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    //auto fetch
    // Sign the user in (or link) with the auto-generated credential
    EasyLoading.dismiss();
    await _auth.signInWithCredential(credential).then((value) {
      if (value.user != null) {
        userState.firebaseUser.value = value.user;
        tryLogin(); //login with our server
      }
    });
  }

  void verificationFailed(FirebaseAuthException e) {
    EasyLoading.dismiss();
    switch (e.code) {
      case 'invalid-phone-number':
        userState.msg.value = 'Invalid Phone Number';
        break;
      default:
        userState.msg.value = e.message!;
    }
  }

  void onCodeSent(String verificationId, int? resendToken) {
    EasyLoading.dismiss();
    userState.verificationId.value = verificationId;
    userState.resendToken.value = resendToken!;
    Get.to(() => OTPScreen());
  }

  void autoRetrievalTimeOut(String verificationId) {
    print('Timeout');
    print(verificationId);
  }

  Future<void> tryLogin() async {
    print('TRYING TO LOGIN');
    EasyLoading.dismiss();
    print(userState.firebaseUser.value);
    try {
      print('ssss');
      Get.to(() => UserDataUpdate());
    } catch (e) {
      print('eeee');
      printError(
        info: e.toString(),
      );
    }
  }
}
