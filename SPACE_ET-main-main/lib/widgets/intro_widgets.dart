import 'package:flutter/material.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';

// curved appbar

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path(); // 1.  top left
    path.lineTo(0, size.height - 50); //2.  bottom left
    path.quadraticBezierTo(
        size.width / 1.5, // 3. bottom center
        size.height / 1.5, // 3.
        size.width, // 4.  bottom right
        size.height - 50 // 4.
        );
    path.lineTo(size.width, 0); // 5. top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// custom appbar

PreferredSizeWidget IntroAppBar(
    {required BuildContext context,
    required String LogoImage,
    required String DesignImage1,
    required String DesignImage2}) {
  double screenHeight = UIParameters.getHeight(context);
  double screenWidth = UIParameters.getWidth(context);
  return AppBar(
    backgroundColor: AppColors.secondary2,
    toolbarHeight: screenHeight * 0.7,
    elevation: 0,
    flexibleSpace: Stack(
      children: [
        ClipPath(
          clipper: CurvedBottomClipper(),
          child: Column(
            children: [
              Container(
                  color: AppColors.secondary,
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Image(
                        image: AssetImage(LogoImage),
                        width: 290,
                        height: 140,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.03,
                              left: screenWidth * 0.4,
                              bottom: screenHeight * 0.06,
                              right: screenWidth * 0.05),
                          child: Image(
                            image: AssetImage(DesignImage1),
                            width: 240,
                            height: 350,
                            fit: BoxFit.fill,
                          )),
                    ],
                  )),
            ],
          ),
        ),
        Positioned(
            top: screenHeight * 0.39,
            left: screenWidth * 0.04,
            child: Image(
              image: AssetImage(DesignImage2),
              width: 240,
              height: 350,
              fit: BoxFit.fill,
            ))
      ],
    ),
  );
}

// custom button

Widget CustomButton(
    {required String onButtonText,
    required BuildContext context,
    required Color buttonColor,
    required TextStyle onButtonTextStyle,
    required Widget route,
    }) {
  double screenHeight = UIParameters.getHeight(context);
  double screenWidth = UIParameters.getWidth(context);
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => route)));
      },
      child: Text(onButtonText, style: onButtonTextStyle),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02, horizontal: screenWidth * 0.15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: AppColors.main, width: 2)),
      ),
    ),
  );
}
