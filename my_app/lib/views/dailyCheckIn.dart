// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/routes/router.gr.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:my_app/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/DashboardOptions.dart';
import '../components/DashboardOptionCard.dart';

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
                height: 60,
              ),

              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Angry"),
                  Text("Sad"),
                  Text("Stressed"),
                  Text("Happy"),
                  Text("Excited"),
                ],
              )*/
              const btn_submit()
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
  bool visibility = true;
  Color colorOfAngry = Colors.white;
  String angryImage = 'assets/images/angry.png';


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
                
                Column(
                  children: [
                    
                    /*InkWell(
                      onTap: () {},
                      
                      splashColor: Colors.red[900],
                      child: Ink.image(image: AssetImage('assets/images/angry.png',), width: 200, height: 200,)
                      ,
                    )*/
                    InkWell(
                      child: Image.asset('assets/images/angry.png', width: 200, height: 200,),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Angry")
                  ]
                ),

                const Padding(padding: EdgeInsets.all(15)),

                  Column(
                    children: [
                      Image.asset('assets/images/sad.png', width: 200, height: 200,),
                      const SizedBox(height: 10,),
                      const Text("Sad")
                    ],
                  ),

                const Padding(padding: EdgeInsets.all(15)),

                  Column(
                    children: [
                      Image.asset('assets/images/stressed.jpg', width: 200, height: 200,),
                      const SizedBox(height: 10,),
                      const Text("Stressed")
                    ],
                  ),

                const Padding(padding: EdgeInsets.all(15)),

                  Column(
                    children: [
                      Image.asset('assets/images/happy.png', width: 200, height: 200,),
                      const SizedBox(height: 10,),
                      const Text("Happy")
                    ],
                  ),

                const Padding(padding: EdgeInsets.all(15)),

                  Column(
                    children: [
                      Image.asset('assets/images/excited.png', width: 200, height: 200,),
                      const SizedBox(height: 10,),
                      const Text("Excited")
                    ],
                  ),
                                  ],
                )
              )
            )
              
                
                /*Image.asset('assets/images/I2PImages/angry.png', width: 200, height: 200,),
                Image.asset("assets/images/I2PImages/sad.png", width: 200, height: 200,),
                Image.asset("assets/images/I2PImages/stressed.jpg", width: 200, height: 200,),
                Image.asset("assets/images/I2PImages/happy.png", width: 200, height: 200,),
                Image.asset("assets/images/I2PImages/excited2.png", width: 200, height: 200,),*/
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

      child: SizedBox(
        
        child: SvgPicture.asset("assets/icons/Submit.svg"),
        width: 150,
        height: 150,
        
      )

      /*child: ListView(
        children: [
          GestureDetector(
            onTap: () {},
          )
          SizedBox()
        ],
      ),*/
    );
    
    /*return Stack(
      alignment: Alignment.center,
      children: [
        Center(child: 
          SvgPicture.asset("assets/icons/Submit.svg")
        ,),
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Submit", 
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white), 
              )
            ], 
          ),
         ) 
      ],
    );*/
  }
}

