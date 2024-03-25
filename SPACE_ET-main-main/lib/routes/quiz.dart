import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_et_first_assignment/routes/intro.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';
import 'package:space_et_first_assignment/widgets/intro_widgets.dart';
import 'package:space_et_first_assignment/widgets/quiz_widget.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool buttonSelected = false;
  bool buttonSelected2 = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = UIParameters.getHeight(context);
    double screenWidth = UIParameters.getWidth(context);

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: quizBefSelectAppBar(
        context: context,
        upperText1: "quiz".tr(),
        upperText2: "question".tr(),
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.85,
                    child: SelectiveButton(
                      context: context,
                      choises: "choises".tr(),
                      isSelected: buttonSelected,
                      onPressed: (isSelected) {
                        setState(() {
                          buttonSelected = isSelected;
                          buttonSelected2 = false;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.85,
                    child: SelectiveButton(
                      context: context,
                      choises: "choises2".tr(),
                      isSelected: buttonSelected2,
                      onPressed: (isSelected) {
                        setState(() {
                          buttonSelected2 = isSelected;
                          buttonSelected = false;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  if (buttonSelected || buttonSelected2)
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.55),
                      child: CustomButton2(
                        onButtonText: "next".tr(),
                        context: context,
                        buttonColor: AppColors.main,
                        onButtonTextStyle: StyleText.introButtons,
                        route: introScreen(),
                      ),
                    ),
                  SizedBox(
                    height: screenHeight * 0.018,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.44,
            child: ClipPath(
              clipper: CurvedUpperClipper(),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.1,
                color: AppColors.secondary2,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.27,
            right: screenWidth * 0.57,
            child: Image(
              image: AssetImage("assets/pictures/bust-23.png"),width: 170,height: 250, fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
