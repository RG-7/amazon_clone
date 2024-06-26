import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/auth_screen/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: OTPScreen(mobileNumber: '+91-9876543210'),
    );
  }
}
