import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/controller/services/user_data_crud_services/user_data_crud_services.dart';
import 'package:amazon_clone/model/user_mode.dart';
import 'package:amazon_clone/utils/colors.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  TextEditingController nameContorller = TextEditingController();
  TextEditingController phoneNumberContorller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneNumberContorller.text = auth.currentUser!.phoneNumber ?? '';
    });
  }

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Your Name',
                style: textTheme.bodyMedium,
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              TextField(
                controller: nameContorller,
                decoration: InputDecoration(
                  hintText: 'First Your Name',
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
              CommonFunctions.blankSpace(height * 0.02, 0),
              Text(
                'Phone Number',
                style: textTheme.bodyMedium,
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              TextField(
                keyboardType: TextInputType.phone,
                readOnly: true,
                controller: phoneNumberContorller,
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone Number',
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
              const Spacer(),
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
                onPressed: () async{
                  UserModel userModel = UserModel(
                      name: nameContorller.text.trim(),
                      mobileNumber: phoneNumberContorller.text.trim(),
                      userType: 'user');
                  await UserDataCRUD.addNewUser(
                      userModel: userModel, context: context);
                },
                child: Text(
                  'Proceed',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
