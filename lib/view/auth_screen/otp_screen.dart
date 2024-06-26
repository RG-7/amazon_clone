

import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/view/auth_screen/auth_screens.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  String mobileNumber;
  OTPScreen({
    super.key,
    required this.mobileNumber,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: white,
        shadowColor: greyShade1,
        title: Image(
          image:const AssetImage(
            'assets/images/amazon_logo.png',
          ),
          height: height * 0.03,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Authentication Required',
                style: textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.mobileNumber,
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' Change',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              Text(
                'We have sent a One Time Password (OTP) to the mobile number above. Please enter it to complete verification',
                style: textTheme.bodyMedium,
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  hintStyle: textTheme.bodyMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:const BorderSide(color: secondaryColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonAuthButton(
                title: 'Continue',
                onPressed: () {},
                btnWidth: 0.94,
              ),
              CommonFunctions.blankSpace(height * 0.03, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Resend OTP',
                      style: textTheme.bodyMedium!.copyWith(
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              const BottomAuthScreenWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
