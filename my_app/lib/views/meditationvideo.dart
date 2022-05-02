import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:my_app/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../views/mediatation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class MeditationVideo extends StatelessWidget {
  static String video = "ZToicYcHIOU";

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: video,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    
    ),
  );


  MeditationVideo({Key? key}) : super(key: key);

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
                          const Text("Meditation",
                              style: TextStyle(
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

            Center(
              child: YoutubePlayer(
                width: 500,
                controller: _controller,
                liveUIColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Video extends StatefulWidget {
  const Video({ Key? key }) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
