import 'package:e_commerce/auth/sign_up_screen.dart';
import 'package:e_commerce/provider/invisible_icon.dart';
import 'package:e_commerce/provider/modalProgressHUD.dart';
import 'package:e_commerce/screens/admin/admin_panel.dart';
import '../screens/user/homePage.dart';
import 'package:e_commerce/widget/facebook_login.dart';
import 'package:e_commerce/widget/google_login.dart';
import 'package:e_commerce/widget/log_in.dart';
import 'package:e_commerce/widget/showSnackBar.dart';
import 'package:e_commerce/widget/sign_up.dart';
import 'package:e_commerce/widget/textformfield_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  static const String id = 'LogIn';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Success",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        textAlign: TextAlign.center,
      ),
      content: Text(
        "Do you want to login as admin or user ?",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          child: Text("Admin"),
          onPressed: () async {
            if (emailController.text.toString().trim().contains("admin")) {
              Navigator.pushNamed(context, AdminPanel.id);
              Provider.of<ProgressProvider>(context, listen: false)
                  .isLoding(false);


            } else {
              showSnackBar(context, 'There is no admin with this data.');
            }
          },
        ),
        TextButton(
            child: Text("User"),
            onPressed: () async {
              Navigator.pushNamed(context, HomePage.id);
              Provider.of<ProgressProvider>(context, listen: false)
                  .isLoding(false);


            }),
      ],
    );
    return Scaffold(
      body:  ModalProgressHUD(
        inAsyncCall: Provider.of<ProgressProvider>(
          context,
        ).inAsyncCall,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                "images/icons/ecommerce.png",
                fit: BoxFit.fill,
                height: 70,
                width: 70,
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormFieldAll(
                              "Email",
                              emailController,
                              false,
                              validatorEmail,
                              prefixIcon:   Icons.email,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormFieldAll(
                              "Password",
                              passwordController,
                              Provider.of<InvisibleIcon>(context).invisible,
                              validatorPassword,
                              ctx: context,
                              suffixIcon: true,
                              prefixIcon:  Icons.lock,


                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SignUp(() async {
                              if (_formKey.currentState.validate()) {
                                UserCredential response = await signInFun(
                                    emailController, passwordController, context);
                                if (response != null) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                }
                              }
                            }, "Log in", 320.0),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 120, 244, 1)
                                      .withOpacity(.6),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Opacity(
                              opacity: .5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  lineWidget(left: 0.0, right: 10.0),
                                  Text(
                                    "Or",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  lineWidget(left: 10.0, right: 0.0),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FacebookLogin(
                              () {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GoogleLogin(
                              () {},
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don\'t have an acount? ",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.4),
                                      fontSize: 15),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, SignUpScreen.id);
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Color.fromRGBO(20, 120, 244, 1)
                                            .withOpacity(.8),
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding lineWidget({left, right}) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right),
      child: Container(
        height: 1.0,
        width: 140.0,
        color: Colors.black.withOpacity(.5),
      ),
    );
  }

  // AlertDialog alert = AlertDialog(
  //
  //   title: Text("Success",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
  //   content: Text(
  //       "Do you want to login as admin or user ?",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
  //   actions: [
  //
  //     TextButton(
  //       child: Text("Admin"),
  //       onPressed: () {
  //         if(  Provider.of<TextFormVal>(context).email.contains("admin") ){
  //
  //         }
  //       },
  //     ),
  //     TextButton(
  //       child: Text("User"),
  //       onPressed: () {},
  //     ),
  //   ],
  // );
}
