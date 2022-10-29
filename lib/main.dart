import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:task_numismatics/controller/google_login_controller.dart';
//
import 'bindings/bindings.dart';
import '../screens/login.dart';

void main() {
  runApp(const MyApp());
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email'
      ]
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInController(),
            child: LoginScreen(),
          )
        ],
      child: GetMaterialApp(
      
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Login UI - Flutter',
      home: LoginScreen(),
    ),
    );
  }

}
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:,
//     );
//   }
//   loginUI(){
//     return StreamConsumer<>
//   }