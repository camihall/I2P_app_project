import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/views/meditationvideo.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:my_app/responsive.dart';
import '../widget/onHoverAnimation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../views/meditationvideo.dart';

class Meditation extends StatelessWidget {
  const Meditation({Key? key}) : super(key: key);

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

            Center(child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    MeditateBox(pic: 'assets/images/meditate-nature.png', topic: "Zen Meditation", videoID: "4JudZVYYJ40", IdList: ["4JudZVYYJ40", "86m4RC_ADEY", "qiTs4iItDTM", "5GSMRUl9UPo", "LL2XUTeoUsM"], meditationType: "Zen",),
                    MeditateBox(pic: "assets/images/meditate-beach.png", topic: "Spiritual Meditation", videoID: "syx3a1_LeFo", IdList: ["syx3a1_LeFo", "v7grtHZAd-0", "G0QdWOcB6Ho", "6VI4Y87paPs", "dXrkP_z2wG4"], meditationType: "Spiritual",),
                    MeditateBox(pic: "assets/images/meditate-pond.png", topic: "Breathing Meditation", videoID: "I-SFdhVwrVA", IdList: ["I-SFdhVwrVA", "VUjiXcfKBn8", "67SeR3LxtdI", "TXNECaIJPDI", "J62F0Y6PKes", "LE406OUgJ0s"], meditationType: "Breathing",),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    MeditateBox(pic: "assets/images/meditate-sky.png", topic: "Mindfulness Meditation", videoID: "ZToicYcHIOU", IdList: ["ZToicYcHIOU", "kH-OQn5Ui8g", "ssss7V1_eyA", "6p_yaNFSYao", "-2zdUXve6fQ"], meditationType: "Mindfulness",),
                    MeditateBox(pic: "assets/images/meditate-pebbles.png", topic: "Focused Meditation", videoID: "zSkFFW--Ma0", IdList: ["zSkFFW--Ma0", "4Bs0qUB3BHQ", "ausxoXBrmWs", "CcqZ47d398k", "vBO8QEjANjs", "xpMlKSZAIks"], meditationType: "Focus",),
                    MeditateBox(pic: "assets/images/meditate-grass.png", topic: "Transcendental Meditation", videoID: "AeLPf4zZx_Q", IdList: ["AeLPf4zZx_Q", "SY2YvQccXiE", "aD-TP_4GtpQ", "1oCJ1MIjEF4", "c-QNd0o8Klw", "9fGfqzPyU0M"], meditationType: "Transcendental",),
                  ],
                )
              ],
            )
            )

          ],
        ),
      ),
    );
  }
}

class ReRoute extends StatelessWidget {
  const ReRoute({ Key? key,
    required this.svg,
    required this.press,
   }) : super(key: key);

  final Stack svg;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: svg
    );
  }
}

class backButton extends StatefulWidget {
  const backButton({ Key? key }) : super(key: key);

  @override
  State<backButton> createState() => _backButtonState();
}

class _backButtonState extends State<backButton> {
  @override
  Widget build(BuildContext context) {
    return 
      OnHoverCheckIn(
        builder: ((isHovered) {
          final svgColor = Stack(children: [SvgPicture.asset("assets/icons/Back.svg", height: 20, width: 20,)],);
          
          return ReRoute(
          svg: svgColor, 
          press: () {
            this.context.navigateBack();
          }
            );
        }), x: 0, y: -15, z: 0,
        
    );  
  }
}

class MeditateBox extends StatefulWidget {
  final String pic;
  final String topic;
  final String videoID;
  final List<String> IdList;
  final String meditationType;

  const MeditateBox({ Key? key, required this.pic, required this.topic, required this.videoID, required this.IdList, required this.meditationType }) : super(key: key);

  @override
  State<MeditateBox> createState() => _MeditateBoxState();
}

class _MeditateBoxState extends State<MeditateBox> {
  @override
  Widget build(BuildContext context) {
    widget.pic;
    widget.topic;
    widget.videoID;
    widget.IdList;
    widget.meditationType;

    return OnHoverCheckIn(
      builder: ((isHovered) {
        return ReRoute(
          svg: Stack(children: [
            Image.asset(widget.pic, height: 334, width: 238,),
                Card(
                  child: Text(widget.topic, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  color: Colors.white,
                ),
          ],
          alignment: Alignment.centerLeft,
        ), 
          press: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => MeditationVideo(videoID: widget.videoID, IdList: widget.IdList, meditationType: widget.meditationType)));
          });
      }), x: 0, y: -15, z: 0,
    );
  }
}
