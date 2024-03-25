import 'package:flutter/material.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';
import 'package:video_player/video_player.dart';

  
  
  Widget build_video_player({
    required BuildContext context,
    required VideoPlayerController controller,
    required Function(bool) statechaneged,
    required bool isplayed
  }) {
    final size = MediaQuery.of(context);
    double screenHeight = UIParameters.getHeight(context);
    double screenWidth = UIParameters.getWidth(context);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.05,),
          Text("باینەری چییە؟",style: StyleText.textButtonStyle.copyWith(decoration: TextDecoration.none),),
          SizedBox(height: screenHeight * 0.03,),
          AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  VideoPlayer(controller),
                  Center(
                    child: IconButton(
                        onPressed: () {
                          if (controller.value.isPlaying) {
                            controller.pause();
                            statechaneged(isplayed);
                          } else {
                            controller.play();
                            statechaneged(!isplayed);
                          }
                        },
                        icon: Icon(
                          color: Colors.white,
                          controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow_rounded,
                          size: 50,
                        )),
                  )
                ],
              )),
              SizedBox(height: screenHeight * 0.06,),
          Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(onPressed: () {}, child: Text("بەردەوامبە",style: StyleText.introButtons,),
              style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.main,
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, horizontal: screenWidth * 0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: AppColors.main, width: 2)),
    ),))
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context, double appBarHeight) {
    return ClipPath(
      clipper: CurvedAppBarClipper(),
      child: Container(
        height: appBarHeight,
        decoration: BoxDecoration(
          color: AppColors.secondary,
        ),
      ),
    );
  }

  Widget buildImageAsset(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Image.asset(
        'assets/pictures/bust-23.png',
        fit: BoxFit.cover,
        height: 200,
      ),
    );
  }


class CurvedAppBarClipper extends CustomClipper<Path> {
  final double topCurveHeight =
      200.0; // Adjust this value to change top curve height
  final double bottomCurveHeight =
      60.0; // Adjust this value to change bottom curve height

  @override
  Path getClip(Size size) {
    Path path = Path();
    double appBarHeight = size.height;

    path.lineTo(0, topCurveHeight);
    path.quadraticBezierTo(
        size.width / 2, topCurveHeight * 1.5, size.width, topCurveHeight);
    path.lineTo(size.width, size.height - bottomCurveHeight);
    path.quadraticBezierTo(
        size.width / 2,
        size.height - (bottomCurveHeight * 2),
        0,
        size.height - bottomCurveHeight);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
