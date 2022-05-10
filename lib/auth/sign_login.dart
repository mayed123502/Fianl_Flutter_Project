import 'package:e_commerce/auth/log_in_screen.dart';
import 'package:e_commerce/auth/sign_up_screen.dart';

import 'package:e_commerce/widget/log_in.dart';
import 'package:e_commerce/widget/sign_up.dart';

import 'package:flutter/material.dart';

class SignOrLogin extends StatelessWidget {
  static const String id = 'SignOrLogin';

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    SignInScreen() {
      Navigator.pushNamed(context, LogInScreen.id);
    }

    // ignore: non_constant_identifier_names
    SigUpScreen() {
      Navigator.pushNamed(context, SignUpScreen.id);
    }

    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 180,
              ),
              Image.asset(
                "images/icons/ecommerce.png",
                fit: BoxFit.fill,
                height: 70,
                width: 70,
              ),
              Text(
                "EVON",
                style: TextStyle(
                  fontFamily: 'Overlock',
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Discover upcoming events \n near you",
                style: TextStyle(
                    fontFamily: 'SourceCodePro',
                    fontSize: 15,
                    color: Colors.black.withOpacity(.5)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 190,
              ),
              SignUp(SigUpScreen,"Sign Up",300.0),
              SizedBox(
                height: 15,
              ),
              LogIn(SignInScreen),
            ],
          ),
        ),
      ),
    );
  }
}
