// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String currentCountryCode = '+91';
  bool inLogin = true;
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: white,
        shadowColor: greyShade1,
        title: Image(
          image: AssetImage(
            'assets/images/amazon_logo.png',
          ),
          height: height * 0.03,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  'Welcome',
                  style: textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CommonFunctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                Builder(builder: (context) {
                  if (inLogin) {
                    return signIn(width, height, textTheme, context);
                  }
                  return createAccount(width, height, textTheme, context);
                }),
                CommonFunctions.blankSpace(height * 0.05, 0),
                BottomAuthScreenWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container signIn(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(border: Border.all(color: greyShade3)),
      child: Column(
        children: [
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              color: greyShade1,
              border: Border(
                bottom: BorderSide(
                  color: greyShade3,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.01,
                      color: !inLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  0,
                  width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' New to Amazon ?',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = true;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: grey),
                          color: white,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.01,
                          color: inLogin ? secondaryColor : transparent,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(
                      0,
                      width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sign In.',
                            style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' Already a Customer',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (value) {
                            setState(
                              () {
                                currentCountryCode = '+${value.phoneCode}';
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.06,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(5),
                          color: greyShade2,
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // phone number textfield
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.64,
                      child: TextFormField(
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.displaySmall,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: textTheme.bodySmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: secondaryColor),
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
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonAuthButton(
                  title: 'Continue',
                  onPressed: () {},
                  btnWidth: 0.88,
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you agree to Amazon\'s',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: ' Condition of Use',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Privacy Notice',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container createAccount(
    double width,
    double height,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Container(
      width: width,
      decoration: BoxDecoration(border: Border.all(color: greyShade3)),
      child: Column(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = false;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: grey),
                          color: white,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.01,
                          color: inLogin ? transparent : secondaryColor,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(
                      0,
                      width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Create Account. ',
                            style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'New to Amazon?',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                SizedBox(
                  height: height * 0.06,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'First and Last Name',
                      hintStyle: textTheme.bodyMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: secondaryColor),
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
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (value) {
                            setState(
                              () {
                                currentCountryCode = '+${value.phoneCode}';
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.06,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(5),
                          color: greyShade2,
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // phone number textfield
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.64,
                      child: TextFormField(
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.displaySmall,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: textTheme.bodyMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: secondaryColor),
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
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                Text(
                  'By enrolling your mobile phone number, you concent to recieve automated security notifications via text message from Amazon. \nMessage and data rates may apply.',
                  style: textTheme.bodyMedium,
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonAuthButton(
                  title: 'Continue',
                  onPressed: () {},
                  btnWidth: 0.88,
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you agree to Amazon\'s',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: ' Condition of Use',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Privacy Notice',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              color: greyShade1,
              border: Border(
                top: BorderSide(
                  color: greyShade3,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.01,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  0,
                  width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' Already a Customer?',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommonAuthButton extends StatelessWidget {
  String title;
  VoidCallback onPressed;
  double? horizontalPadding;
  double btnWidth;
  CommonAuthButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.btnWidth});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: transparent, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        minimumSize: Size(width * btnWidth, height * 0.055),
        backgroundColor: amber,
      ),
      child: Text(
        title,
        style: textTheme.displaySmall,
      ),
    );
  }
}

class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          height: 2,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [white, greyShade3, white],
            ),
          ),
        ),
        CommonFunctions.blankSpace(height * 0.02, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Condition of Use',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Privacy Notice',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Help',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
          ],
        ),
        CommonFunctions.blankSpace(height * 0.01, 0),
        Text(
          '\u00A9 1996-2024, Amazon.com, Inc. or its affiliates',
          style: textTheme.labelMedium!.copyWith(color: grey),
        ),
      ],
    );
  }
}
