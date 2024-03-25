import 'package:flutter/material.dart';
import 'package:space_et_first_assignment/themes/themes.dart';

class StyleText{

    static const introButtons = TextStyle(
      color: AppColors.secondary2,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: "DroidKufi"
      );

      static const header = TextStyle(
        color: AppColors.primary,
        fontSize: 33,
        fontWeight: FontWeight.bold,
        fontFamily: "DroidKufi"
        );

        static const textFieldStyle = TextStyle(
          color: AppColors.primaryWithOpacity,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "DroidKufi"
          );

        static const textButtonStyle = TextStyle(
          color: AppColors.primary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "DroidKufi",
          decoration: TextDecoration.underline
          );

}