import 'package:amazon_clone/controller/provider/auth/auth_provider.dart';
import 'package:amazon_clone/firebase_options.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/auth/auth_screens.dart';
import 'package:amazon_clone/view/auth/otp_screen.dart';
import 'package:amazon_clone/view/auth/signin_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ServiceAuthProvider>(
            create: (_) => ServiceAuthProvider()),
      ],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const SignInLogic(),
      ),
    );
  }
}
