import 'dart:developer';

import 'package:amazon_clone/controller/provider/auth/auth_provider.dart';
import 'package:amazon_clone/view/auth/otp_screen.dart';
import 'package:amazon_clone/view/auth/signin_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthServices {
  static bool checkAuthentication() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  static receiveOTP(
      {required BuildContext context, required String mobileNumber}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          log(credential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          context
              .read<ServiceAuthProvider>()
              .updateVerificationId(verificationID: verificationId);
          Navigator.push(
            context,
            PageTransition(
              child: OTPScreen(mobileNumber: mobileNumber),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<ServiceAuthProvider>().verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
            context,
            PageTransition(
              child:const SignInLogic(),
              type: PageTransitionType.rightToLeft,
            ),
          );
    } catch (e) {
      log(e.toString());
    }
  }
}
