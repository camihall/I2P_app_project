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
                          const Text("Daily Check In",
                              style: TextStyle(
                                  color: Color(0xff0B3F24),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)),
                        ],
                      ),
                    ],
                  )),
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

                  OnHoverCheckIn(
                    builder: ((isHovered) {
                      final svgcolor = isHovered ? SvgPicture.asset('assets/icons/angry-emoji.svg', height: 150, width: 150, color: Colors.red[800],): SvgPicture.asset('assets/icons/angry-emoji.svg', height: 150, width: 150,);
                      final textColor = isHovered ? Text("Angry", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red[800],),) : const Text("Angry", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
                      
                      return Column(
                        children: [
                          ReRoute(
                            svg: svgcolor, 
                            press: () {}
                            ),
                          //svgcolor,
                          const SizedBox(height: 10,),
                          textColor
                    ],
                  );
                })
                    
              ),

                    const Padding(padding: EdgeInsets.all(15)),

                    OnHoverCheckIn(
                      builder:((isHovered) {
                        final svgcolor = isHovered ? SvgPicture.asset('assets/icons/sad-emoji.svg', height: 150, width: 150, color: Colors.blue[700],): SvgPicture.asset('assets/icons/sad-emoji.svg', height: 150, width: 150,);
                        final textColor = isHovered ? Text("Sad", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue[700],),) : const Text("Sad", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
                        
                        return Column(
                            children: [
                              svgcolor,
                              const SizedBox(height: 10,),
                              textColor
                            ],
                          );
                      }     
                    )
                  ),

                  const Padding(padding: EdgeInsets.all(15)),

                  OnHoverCheckIn(
                      builder:((isHovered) {
                        final svgcolor = isHovered ? SvgPicture.asset('assets/icons/disgust-emoji1.svg', height: 150, width: 150, color: Colors.lightGreen[600],): SvgPicture.asset('assets/icons/disgust-emoji1.svg', height: 150, width: 150,);
                        final textColor = isHovered ? Text("Disgusted", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.lightGreen[600],),) : const Text("Disgusted", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
                        
                        return Column(
                            children: [
                              svgcolor,
                              const SizedBox(height: 10,),
                              textColor
                            ],
                          );
                      }     
                    )
                  ),

                  const Padding(padding: EdgeInsets.all(15)),

                  OnHoverCheckIn(
                      builder:((isHovered) {
                        final svgcolor = isHovered ? SvgPicture.asset('assets/icons/fear-emoji.svg', height: 150, width: 150, color: Colors.purple[700],): SvgPicture.asset('assets/icons/fear-emoji.svg', height: 150, width: 150,);
                        final textColor = isHovered ? Text("Fear", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple[700],),) : const Text("Fear", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
                        
                        return Column(
                            children: [
                              svgcolor,
                              const SizedBox(height: 10,),
                              textColor
                            ],
                          );
                      }     
                    )
                  ),

                  const Padding(padding: EdgeInsets.all(15)),
        
                  OnHoverCheckIn(
                      builder:((isHovered) {
                        final svgcolor = isHovered ? SvgPicture.asset('assets/icons/suprised-emoji.svg', height: 150, width: 150, color: Colors.pink[300],): SvgPicture.asset('assets/icons/suprised-emoji.svg', height: 150, width: 150,);
                        final textColor = isHovered ? Text("Suprised", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.pink[300],),) : const Text("Suprised", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
                        
                        return Column(
                            children: [
                              svgcolor,
                              const SizedBox(height: 10,),
                              textColor
                            ],
                          );
                      }     
                    )
                  ),

                  const Padding(padding: EdgeInsets.all(15)),
                  
                  OnHoverCheckIn(
                      builder:((isHovered) {
                        final svgcolor = isHovered ? SvgPicture.asset('assets/icons/happy-emoji.svg', height: 150, width: 150, color: Colors.yellow,): SvgPicture.asset('assets/icons/happy-emoji.svg', height: 150, width: 150,);
                        final textColor = isHovered ? const Text("Happy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.yellow,),) : const Text("Happy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
                        
                        return Column(
                            children: [
                              svgcolor,
                              const SizedBox(height: 10,),
                              textColor
                            ],
                          );
                      }     
                    )
                  ),
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
        }),
        
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
