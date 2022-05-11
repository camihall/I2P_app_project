// ignore_for_file: file_names
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/routes/router.gr.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:my_app/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../views/exercises.dart';
import '../widget/onHoverAnimation.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({Key? key}) : super(key: key);

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
                          Column(
                            children: const [
                            Text("Daily Check In",
                              style: TextStyle(
                                  color: Color(0xff0B3F24),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)),
                            SizedBox(width: 10,),
                            Text("Connect With Yourself",
                                style: TextStyle(
                                  color: Color(0x000b3f24),
                                  fontSize: 18
                                ),
                            ),
                            ]
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(20),
              child: const backButton()
            ),
            Center(
            child: Column(children: [
              const Text("Daily Check In",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                  ),
              ),

              const SizedBox(
                  height: 20,
              ),

              Text("How are you feeling today?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[700]
                  ),
              ),

              const SizedBox(
                height: 30,
              ),

              const hoverchange(),

              
              const SizedBox(
                height: 50,
              ),

              const btn_submit(),

              const SizedBox(
                height: 100,
              )
            ],
            ),
            )
          ],
        ),
      ),
    );
  }
}

class hoverchange extends StatefulWidget {
  const hoverchange({ Key? key }) : super(key: key);

  @override
  State<hoverchange> createState() => _hoverchangeState();
}

class _hoverchangeState extends State<hoverchange> {
  List<bool> clicked = [false, false, false, false, false, false];
  List<Color> faceColors = [(Colors.red[800])!, (Colors.blue[700])!, (Colors.lightGreen[700])!, (Colors.purple[700])!, (Colors.pink[300])!, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,                                  
                children: [

                  MoodSelect(pic: 'assets/icons/angry-emoji.svg', mood: 'Angry', color: (Colors.red[800])!,),
                  
                  const Padding(padding: EdgeInsets.all(15)),

                  MoodSelect(pic: 'assets/icons/sad-emoji.svg', mood: 'Sad', color: (Colors.blue[700])!,),
                  
                  const Padding(padding: EdgeInsets.all(15)),

                  MoodSelect(pic: 'assets/icons/disgust-emoji1.svg', mood: 'Disgust', color: (Colors.lightGreen[700])!,),
                  
                  const Padding(padding: EdgeInsets.all(15)),

                  MoodSelect(pic: 'assets/icons/fear-emoji.svg', mood: 'Fear', color: (Colors.purple[700])!,),
                  
                  const Padding(padding: EdgeInsets.all(15)),
                  
                  MoodSelect(pic: 'assets/icons/suprised-emoji.svg', mood: 'Suprised', color: (Colors.pink[300])!,),
                  
                  const Padding(padding: EdgeInsets.all(15)),

                  MoodSelect(pic: 'assets/icons/happy-emoji.svg', mood: 'Happy', color: (Colors.yellow[700])!,),

                ],
              ),
            ),
          ),
        ],
      );
    }
  }

class btn_submit extends StatefulWidget {
  const btn_submit({ Key? key }) : super(key: key);

  @override
  State<btn_submit> createState() => _btn_submitState();
}

class _btn_submitState extends State<btn_submit> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      OnHoverCheckIn(
        builder: ((isHovered) {
          final svgColor = isHovered ? SvgPicture.asset("assets/icons/Submit.svg", height: 60, width: 60,) : SvgPicture.asset("assets/icons/Submit.svg", height: 60, width: 60,);
          return ReRoute(
          svg: svgColor, 
          press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const checkInToExercises()),
                );
              },
            );
        }), x: 0, y: -15, z: 0,
        
          )  
        );
      }
    }

class ReRoute extends StatelessWidget {
  const ReRoute({ Key? key,
    required this.svg,
    required this.press,
   }) : super(key: key);

  final SvgPicture svg;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: svg
    );
  }
}



class MoodSelect extends StatefulWidget {
  final String pic;
  final String mood;
  final Color color;
  const MoodSelect({ Key? key, required this.pic, required this.mood, required this.color }) : super(key: key);

  @override
  State<MoodSelect> createState() => _MoodSelectState();
}

class _MoodSelectState extends State<MoodSelect> {
  
  @override
  Widget build(BuildContext context) {
    widget.pic;
    widget.mood;
    widget.color;
    bool _buttonSelected = false;

    return OnHoverCheckIn(
      builder:((isHovered) {
        final svgcolor = isHovered || _buttonSelected ? SvgPicture.asset(widget.pic, height: 150, width: 150, color: widget.color) 
        : SvgPicture.asset(widget.pic, height: 150, width: 150,);
        final textColor = isHovered || _buttonSelected ? Text(widget.mood, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: widget.color,),) : Text(widget.mood, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);

        return GestureDetector(
          onTap:() {
            _buttonSelected = !_buttonSelected;
          },
          child: Column(
            children: [
              svgcolor,
              const SizedBox(height: 10,),
              textColor
              ]
            ),
          );
        }
      ), x: 0, y: -15, z: 0, //How much to move up or down the icon on hover
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
          final svgColor = SvgPicture.asset("assets/icons/Back.svg", height: 20, width: 20,);
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
