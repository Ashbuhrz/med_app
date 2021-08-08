import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

bool checkFormField(
    {required List<TextEditingController> forms,
    bool hasEmail = false,
    TextEditingController? emailField}) {
  if (hasEmail) {
    if (!forms
        .map((element) => element.text.isNotEmpty)
        .toList()
        .contains(false)) {
      if (GetUtils.isEmail(emailField!.text)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    if (!forms
        .map((element) => element.text.isNotEmpty)
        .toList()
        .contains(false)) {
      return true;
    } else {
      return false;
    }
  }
}
