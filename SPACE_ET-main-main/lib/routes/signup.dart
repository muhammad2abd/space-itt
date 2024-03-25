import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_et_first_assignment/routes/intro.dart';
import 'package:space_et_first_assignment/routes/login.dart';
import 'package:space_et_first_assignment/routes/quiz.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';
import 'package:space_et_first_assignment/widgets/intro_widgets.dart';
import 'package:space_et_first_assignment/widgets/login_signup_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
          Center(child: Text("خۆتۆمارکردن", style: StyleText.header)),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          EmailNameTextField(
            context: context,
            text: "ناو",
            inputType: TextInputType.name,
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          EmailNameTextField(
            context: context,
            text: "ئیمێڵ",
            inputType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          PasswordTextField(
            context: context,
            text: "وشەی نهێنی",
            inputType: TextInputType.visiblePassword,
            obscureText: _obscurePassword,
            toggleVisibility: _togglePasswordVisibility,
          ),
          SizedBox(
            height: screenHeight * 0.08,
          ),
          CustomButton(
              onButtonText: "بەردەوامبە",
              context: context,
              buttonColor: AppColors.main,
              onButtonTextStyle: StyleText.introButtons,
              route: Quiz()),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          ButtonText(
              text: "پێشتر خۆت تۆمارکردووە؟ \n لە بری ئەوە بچۆ ژوورەوە",
              context: context,
              route: LoginScreen(),
              textColor: AppColors.main),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: AssetImage("assets/pictures/bust-2.png"),
                width: 170,
                height: 197,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: AssetImage("assets/pictures/bust-1.png"),
                width: 160,
                height: 197,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
