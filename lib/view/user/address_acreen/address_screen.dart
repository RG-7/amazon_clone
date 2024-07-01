import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * 0.08),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.01),
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              children: [
                Image(
                  image: const AssetImage(
                    'assets/images/amazon_black_logo.png',
                  ),
                  height: height * 0.04,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddressScreenTextWidget(
                  nameController: nameController,
                  hintText: 'Your Name',
                  title: 'Enter Your Name',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextWidget(
                  nameController: mobileNumberController,
                  hintText: 'Your Phone Number',
                  title: 'Enter Your Phone Number',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextWidget(
                  nameController: houseNumberController,
                  hintText: 'Your House Number',
                  title: 'Enter Your House Number',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextWidget(
                  nameController: areaController,
                  hintText: 'Your Area',
                  title: 'Enter Your Area',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextWidget(
                  nameController: landMarkController,
                  hintText: 'Your LandMark',
                  title: 'Enter Your LandMark',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextWidget(
                  nameController: pincodeController,
                  hintText: 'Your PinCode',
                  title: 'Enter Your PinCode',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextWidget(
                  nameController: townController,
                  hintText: 'Your Town',
                  title: 'Enter Your Town',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextWidget(
                  nameController: stateController,
                  hintText: 'Your State',
                  title: 'Enter Your State',
                ),
                CommonFunctions.blankSpace(height * 0.04, 0),
                // const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    minimumSize: Size(
                      width,
                      height * 0.06,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Proceed',
                    style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressScreenTextWidget extends StatelessWidget {
  const AddressScreenTextWidget({
    super.key,
    required this.nameController,
    required this.title,
    required this.hintText,
  });

  final TextEditingController nameController;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium,
        ),
        CommonFunctions.blankSpace(height * 0.01, 0),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: width * 0.03,
            ),
            hintText: hintText,
            hintStyle: textTheme.bodyMedium,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: secondaryColor),
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
      ],
    );
  }
}
