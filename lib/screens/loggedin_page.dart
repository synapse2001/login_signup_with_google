import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:task_numismatics/controller/google_login_controller.dart';
import 'package:task_numismatics/screens/login.dart';
import 'package:task_numismatics/screens/signup.dart';

class LoggedIN extends StatefulWidget {
  const LoggedIN({Key? key}) : super(key: key);

  @override
  State<LoggedIN> createState() => _LoggedINState();
}

class _LoggedINState extends State<LoggedIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: loginUI(),
    );

  }
  loginUI(){
    return Consumer<GoogleSignInController>(
      builder: (context,model,child){
        if(model.googleAccount != null){
          return Center(child :loggedInUI(model),);
        }
        else {
          return loginControls(context);
        }
      }
    );
  }
  loggedInUI(GoogleSignInController model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.googleAccount!.photoUrl ??'').image,
        ),
        Text(model.googleAccount!.displayName ??''),
        Text(model.googleAccount!.email),
        ActionChip(
            label: Text("Logout"),
            onPressed: (){
              Provider.of<GoogleSignInController>(context,listen: false).logOut();
              Get.to(LoginScreen());
              // Get.offAll(
              //       () => LoginScreen(),
              //   transition: Transition.leftToRight,
              // );

            }
        ),
      ],
    );
  }

  loginControls(BuildContext context) {
    return 0;
    //Get.to(SignUpScreen());

  }
}



