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
                    MeditateBox(pic: 'assets/images/meditate-nature.png', topic: "Zen Meditation"),
                    MeditateBox(pic: "assets/images/meditate-beach.png", topic: "Spiritual Meditation"),
                    MeditateBox(pic: "assets/images/meditate-pond.png", topic: "Breathing Meditation"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    MeditateBox(pic: "assets/images/meditate-sky.png", topic: "Mindfulness Meditation"),
                    MeditateBox(pic: "assets/images/meditate-pebbles.png", topic: "Focused Meditation"),
                    MeditateBox(pic: "assets/images/meditate-grass.png", topic: "Transcendental Meditation"),
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

  const MeditateBox({ Key? key, required this.pic, required this.topic }) : super(key: key);

  @override
  State<MeditateBox> createState() => _MeditateBoxState();
}

class _MeditateBoxState extends State<MeditateBox> {
  @override
  Widget build(BuildContext context) {
    widget.pic;
    widget.topic;


    return OnHoverCheckIn(
      builder: ((isHovered) {
        return ReRoute(
          svg: Stack(children: [
            Image.asset(widget.pic, height: 334, width: 238,),
                Card(
                  child: Text(widget.topic, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  color: Colors.grey[300],
                ),
          ],
          alignment: Alignment.centerLeft,
        ), 
          press: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => MeditationVideo()));
          });
      }), x: 0, y: -15, z: 0,
    );
  }
}