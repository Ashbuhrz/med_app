// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:machinetest/core/util/textfield_validator.dart';

void main() {
  group('CheckFormField', () {
    test('NonEmpty field gives false', () {
      final field = checkFormField(forms: [TextEditingController(text: '')]);
      expect(field, false);
    });

    test('empty field gives false', () {
      final field =
          checkFormField(forms: [TextEditingController(text: 'asbah')]);
      expect(field, true);
    });

    test('Invalid email gives false', () {
      final email = checkFormField(
          forms: [TextEditingController(text: '')],
          hasEmail: true,
          emailField: TextEditingController(text: ''));
      expect(email, false);
    });

    test('Valid Email should give true', () {
      final email = checkFormField(
        forms: [TextEditingController(text: 'Asbah')],
        hasEmail: true,
        emailField: TextEditingController(text: 'asbahriyas47@gmail.com'),
      );
      expect(email, true);
    });
  });
}
