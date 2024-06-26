import 'package:flutter/material.dart';

class ServiceAuthProvider extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';

  updatePhoneNumber({required String num}) {
    phoneNumber = num;
    notifyListeners();
  }

  updateVerificationId({required String verificationID}) {
    verificationId = verificationID;
    notifyListeners();
  }
}
