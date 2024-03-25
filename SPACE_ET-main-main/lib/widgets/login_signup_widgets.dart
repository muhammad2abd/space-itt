import 'package:flutter/material.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';

// custom appbar

PreferredSizeWidget customAppBarLogSign(
    {required BuildContext context, required Widget route}) {
  return AppBar(
      elevation: 0,
      backgroundColor: AppColors.secondary2,
      iconTheme: IconThemeData(color: AppColors.primary, size: 30),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: ((context) => route)));
          },
        ),
      ]);
}

// Text Field

Widget EmailNameTextField({
  required BuildContext context,
  required String text,
  required TextInputType inputType,
}) {
  double screenHeight = UIParameters.getHeight(context);
  double screenWidth = UIParameters.getWidth(context);
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
    child: Container(
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryWithOpacity,
          border: Border.all(width: 1, color: AppColors.primaryWithOpacity)),
      child: Center(
        child: TextField(
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: StyleText.textFieldStyle,
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          ),
          style: StyleText.textFieldStyle.copyWith(color: AppColors.primary),
        ),
      ),
    ),
  );
}

// Password Text Field

Widget PasswordTextField({
  required BuildContext context,
  required String text,
  required TextInputType inputType,
  required bool obscureText,
  required VoidCallback toggleVisibility,
}) {
  double screenHeight = UIParameters.getHeight(context);
  double screenWidth = UIParameters.getWidth(context);
  bool obsText = true;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
    child: Container(
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryWithOpacity,
          border: Border.all(width: 1, color: AppColors.primaryWithOpacity)),
      child: Center(
        child: TextField(
          obscureText: obscureText,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: StyleText.textFieldStyle,
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColors.primary,
              ),
              onPressed: toggleVisibility,
            ),
          ),
          style: StyleText.textFieldStyle.copyWith(color: AppColors.primary),
        ),
      ),
    ),
  );
}

// Text button

Widget ButtonText({
  required String text,
  required BuildContext context,
  required Widget route,
  required Color textColor,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => route)));
    },
    child: Text(
      text,
      style: StyleText.textButtonStyle.copyWith(color: textColor),
      textAlign: TextAlign.center,
    ),
  );
}
