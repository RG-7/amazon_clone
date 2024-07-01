import 'dart:developer';

import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/model/user_mode.dart';
import 'package:amazon_clone/view/auth/signin_logic.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UserDataCRUD {
  static addNewUser(
      {required UserModel userModel, required BuildContext context}) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.phoneNumber)
          .set(userModel.toMap())
          .whenComplete(() {
        log('Data Added');
        CommonFunctions.showSuccessToast(
            context: context, message: 'User Added Successfully');
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const SignInLogic(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showErrorToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUser() async {
    bool userPresent = false;
    try {
      await firestore
          .collection('users')
          .where('mobileNumber', isEqualTo: auth.currentUser!.phoneNumber)
          .get()
          .then((value) {
        value.size > 0 ? userPresent = true : userPresent = false;
      });
    } catch (e) {
      log(e.toString());
    }
    return userPresent;
  }
}
