import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:machinetest/features/medical_app/domain/entity/user_model.dart';

class UserState {
  Rxn<User> firebaseUser = Rxn<User>();

  var phoneNumber = ''.obs;
  var userId = ''.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var resendToken = 0.obs;
  var verificationId = ''.obs;
  var isLoading = false.obs;
  var msg = ''.obs;

  final Rx<UserModel> _registerModel = UserModel().obs;

  void updateRegistrationModel() {
    _registerModel.refresh();
  }

  UserModel get registerModel => _registerModel();

  set setRegisterModel(value) => _registerModel.value = value;
}
