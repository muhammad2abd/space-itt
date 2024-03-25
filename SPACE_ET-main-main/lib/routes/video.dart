import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_et_first_assignment/themes/textStyle.dart';
import 'package:space_et_first_assignment/themes/themes.dart';
import 'package:space_et_first_assignment/themes/ui_parameters.dart';
import 'package:space_et_first_assignment/widgets/videoWidget.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool videoplayed = false;
  late VideoPlayerController _controller;
  bool loaded = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
    _controller.initialize().then((value) {
      setState(() {
        loaded = true;
      });
    });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 2 / 3;
    double screenHeight = UIParameters.getHeight(context);
    double screenWidth = UIParameters.getWidth(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
        elevation: 0,
        backgroundColor: AppColors.secondary2,
        title:  Center(child: Text("وانەی یەکەم-تەکنۆلۆجی", style: StyleText.textButtonStyle.copyWith(decoration: TextDecoration.none),)),
        leading: BackButton(),
        actions: [Container(width: screenWidth * 0.15,)],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildAppBar(context, appBarHeight),
          build_video_player(context: context,controller: _controller,statechaneged: (isPlayed) {
                        setState(() {
                          videoplayed = isPlayed;
                          videoplayed = true;
                        });
                      },
                      isplayed: true
                      ),
          buildImageAsset(context)
        ],
      ),
    );
  }
}