import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_et_first_assignment/routes/login.dart';
import 'package:space_et_first_assignment/routes/signup.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';
import 'package:space_et_first_assignment/widgets/intro_widgets.dart';

class introScreen extends StatefulWidget {
  const introScreen({super.key});

  @override
  State<introScreen> createState() => _introScreenState();
}

class _introScreenState extends State<introScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = UIParameters.getHeight(context);
    double screenWidth = UIParameters.getWidth(context);
    return Scaffold(
      appBar: IntroAppBar(
          context: context,
          LogoImage: "assets/pictures/space.png",
          DesignImage1: "assets/pictures/peep-3.png",
          DesignImage2: "assets/pictures/peep-4.png"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
                onButtonText: "login".tr(),
                context: context,
                buttonColor: AppColors.main,
                onButtonTextStyle: StyleText.introButtons,
                route: LoginScreen(),
                ),
            CustomButton(
                onButtonText: "signup".tr(),
                context: context,
                buttonColor: AppColors.secondary2,
                onButtonTextStyle:
                    StyleText.introButtons.copyWith(color: AppColors.primary),
                route: SignupScreen()),
          ],
        ),
      ),
    );
  }
}
