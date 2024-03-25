import 'package:flutter/material.dart';
import 'package:space_et_first_assignment/routes/intro.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';
import 'package:space_et_first_assignment/widgets/intro_widgets.dart';

class CurvedBottomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path(); // 1.  top left
    path.lineTo(0, size.height - 50); //2.  bottom left
    path.quadraticBezierTo(
        size.width / 2, // 3. bottom center
        size.height * 1, // 3.
        size.width, // 4.  bottom right
        size.height - 70 // 4.
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

class CurvedUpperClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 2); // Start at the left middle
    path.quadraticBezierTo(
      size.width / 2, // Control point X (middle of the width)
      0, // Control point Y (top of the height)
      size.width, // End point X (end of the width)
      size.height / 2, // End point Y (middle of the height)
    );
    // Add a semi-circle at the top
    path.arcToPoint(
      Offset(0, size.height / 2), // Center of the circle
      radius: Radius.circular(size.width / 2), // Radius of the circle
      clockwise: true, // Drawing direction (clockwise)
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

PreferredSizeWidget quizBefSelectAppBar({
  required BuildContext context,
  required String upperText1,
  required String upperText2,
}) {
  double screenHeight = UIParameters.getHeight(context);
  double screenWidth = UIParameters.getWidth(context);
  return AppBar(
    backgroundColor: AppColors.secondary,
    toolbarHeight: screenHeight * 0.4,
    elevation: 0,
    automaticallyImplyLeading: false,
    iconTheme: IconThemeData(color: AppColors.primary),
    flexibleSpace: ClipPath(
      clipper: CurvedBottomClipper2(),
      child: Column(
        children: [
          Center(
            child: Container(
                color: AppColors.secondary2,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.9),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => introScreen())));
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      upperText1,
                      style: StyleText.header,
                    ),
                    Text(
                      upperText2,
                      style: StyleText.header
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: screenHeight * 0.13,
                    ),
                  ],
                )),
          ),
        ],
      ),
    ),
  );
}

Widget SelectiveButton({
  required BuildContext context,
  required String choises,
  required bool isSelected,
  required Function(bool) onPressed,
}) {
  double screenHeight = UIParameters.getHeight(context);
  double screenWidth = UIParameters.getWidth(context);
  return ElevatedButton(
    onPressed: () {
      onPressed(!isSelected);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? AppColors.main : AppColors.secondary2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    child: Text(
      choises,
      style: StyleText.introButtons.copyWith(
        color: isSelected ? AppColors.secondary2 : AppColors.primary,
      ),
    ),
  );
}

Widget CustomButton2({
  required String onButtonText,
  required BuildContext context,
  required Color buttonColor,
  required TextStyle onButtonTextStyle,
  required Widget route,
}) {
  double screenHeight = UIParameters.getHeight(context);
  double screenWidth = UIParameters.getWidth(context);
  return ElevatedButton(
    onPressed: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => route)));
    },
    child: Text(onButtonText, style: onButtonTextStyle),
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02, horizontal: screenWidth * 0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: AppColors.main, width: 2)),
    ),
  );
}
