import 'package:amazon_clone/controller/services/auth/auth_services.dart';
import 'package:amazon_clone/controller/services/user_data_crud_services/user_data_crud_services.dart';
import 'package:amazon_clone/view/auth/auth_screens.dart';
import 'package:amazon_clone/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:amazon_clone/view/user/user_persistant_navbar/user_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkUser() async {
    bool userAlreadyThere = await UserDataCRUD.checkUser();
    if (userAlreadyThere == true) {
      Navigator.push(
        context,
        PageTransition(
          child: const UserBottomNavBar(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } else {
      Navigator.push(
        context,
        PageTransition(
          child: const UserDataInputScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }
  }

  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated
        ? checkUser()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/amazon_splash_screen.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
