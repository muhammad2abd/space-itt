import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_et_first_assignment/routes/intro.dart';
import 'package:space_et_first_assignment/routes/quiz.dart';
import 'package:space_et_first_assignment/routes/signup.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';
import 'package:space_et_first_assignment/widgets/intro_widgets.dart';
import 'package:space_et_first_assignment/widgets/login_signup_widgets.dart';
import 'package:space_et_first_assignment/widgets/quiz_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = UIParameters.getHeight(context);
    double screenWidth = UIParameters.getWidth(context);
    return Scaffold(
      appBar: customAppBarLogSign(context: context, route: introScreen()),
      backgroundColor: AppColors.secondary2,
      body: ListView(
        children: [
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Center(child: Text("login".tr(), style: StyleText.header)),
          SizedBox(
            height: screenHeight * 0.06,
          ),
          EmailNameTextField(
            context: context,
            text: "email".tr(),
            inputType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          PasswordTextField(
            context: context,
            text: "password".tr(),
            inputType: TextInputType.visiblePassword,
            obscureText: _obscurePassword,
            toggleVisibility: _togglePasswordVisibility,
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          CustomButton(
              onButtonText: "logSignButton".tr(),
              context: context,
              buttonColor: AppColors.main,
              onButtonTextStyle: StyleText.introButtons,
              route: Quiz(),
              ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          ButtonText(
              text: "loginTextLink".tr(),
              context: context,
              route: SignupScreen(),
              textColor: AppColors.primary),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: AssetImage("assets/pictures/bust-2.png"),
                width: 170,
                height: 222,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: AssetImage("assets/pictures/bust-1.png"),
                width: 160,
                height: 222,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
