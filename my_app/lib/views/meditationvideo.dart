import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:my_app/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../views/mediatation.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../views/mediatation.dart';



class MeditationVideo extends StatelessWidget {
  final String videoID;
  final List<String> IdList;
  final String meditationType;

  const MeditationVideo({Key? key, required this.videoID, required this.IdList, required this.meditationType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomPaint(
              painter: DashboardHeader(),
              child: SizedBox(
                  height: 350,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20),
                          if (!Responsive.isDesktop(context))
                            IconButton(
                              icon: const Icon(Icons.menu),
                              iconSize: 40,
                              onPressed:
                                  context.read<MenuController>().controlMenu,
                            ),
                          const SizedBox(width: 30),
                          Text(meditationType + " Meditation",
                              style: const TextStyle(
                                  color: Color(0xff0B3F24),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)),
                        ],
                      ),
                    ],
                  )),
            ),

            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(20),
              child: const backButton(),
            ),

            const SizedBox(height: 50,),

             Center(
              child: YoutubeAppDemo(videoId: (videoID), IdList: IdList,),
            ),

            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

class YoutubeAppDemo extends StatefulWidget {
  final String videoId;
  final List<String> IdList;
  const YoutubeAppDemo({ Key? key, required this.videoId, required this.IdList }) : super(key: key);

  @override
  State<YoutubeAppDemo> createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId, 
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        desktopMode: true,
        privacyEnhanced: true,
        strictRelatedVideos: true,
        autoPlay: true,
        playlist: widget.IdList,
      ) );
  }
  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return 
    SizedBox(
      child:
        YoutubePlayerControllerProvider(
          controller: _controller, 
          child: player), width: 1000,
    );
  }
}
