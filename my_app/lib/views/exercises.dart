import 'package:flutter/material.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:provider/provider.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import '../responsive.dart';
import 'textbox.dart';

class exercises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Exercises',
      home: Scaffold(
        body: SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(context: context),
              ),
            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SafeArea(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 20),
                                      if (!Responsive.isDesktop(context))
                                        IconButton(
                                          icon: const Icon(Icons.menu),
                                          iconSize: 40,
                                          onPressed: context
                                              .read<MenuController>()
                                              .controlMenu,
                                        ),
                                      const SizedBox(width: 30),
                                      const Text("Exercises",
                                          style: TextStyle(
                                              color: Color(0xff0B3F24),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40)),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 50),
                                      if (!Responsive.isDesktop(context))
                                        const SizedBox(width: 55),
                                      const Text(
                                          "You have 2 exercises to complete today",
                                          style: TextStyle(
                                              color: Color(0xff0B3F24),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20)),
                                    ],
                                  )
                                ],
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: exerciseAll(),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        )),
      ),
    );
  }
}

class exerciseAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [exerciseBox()]);
  }
}
class checkInToExercises extends StatelessWidget {
  const checkInToExercises({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Exercises',
      home: Scaffold(
        body: SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SafeArea(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 20),
                                      if (!Responsive.isDesktop(context))
                                        IconButton(
                                          icon: const Icon(Icons.menu),
                                          iconSize: 40,
                                          onPressed: context
                                              .read<MenuController>()
                                              .controlMenu,
                                        ),
                                      const SizedBox(width: 30),
                                      const Text("Exercises",
                                          style: TextStyle(
                                              color: Color(0xff0B3F24),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40)),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 50),
                                      if (!Responsive.isDesktop(context))
                                        const SizedBox(width: 55),
                                      const Text(
                                          "You have 2 exercises to complete today",
                                          style: TextStyle(
                                              color: Color(0xff0B3F24),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20)),
                                    ],
                                  )
                                ],
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: exerciseAll(),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        )),
      ),
    
      
    );
  }
}

String clickedQ = "";

class questionBox extends StatelessWidget {
  final String qText;
  questionBox({required String qText}) : this.qText = qText;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickedQ = qText;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TxtbxRoute()),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .04,
        width: MediaQuery.of(context).size.width * .70,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xE7E7E7dd), width: .5))),
        child: Text(qText),
      )
    );
  }
}

final questions = [
  questionBox(
    qText: 'What makes you think it might be time for a change?',
  ),
  questionBox(
    qText: 'What was being in an extremist movement like for you?',
  ),
  questionBox(
    qText: 'How has your time in an extremist movement impacted you?',
  ),
  questionBox(
    qText:
        'What things do you think you would need to do to help yourself grow?',
  ),
  questionBox(
    qText:
        'How do you feel you have grown and changed in the [amount of time]?',
  ),
  questionBox(
    qText: 'What makes you think you need to change your actions?',
  ),
  questionBox(
    qText: 'What will happen if you don\'t change your current actions',
  ),
  questionBox(
    qText: 'What will be different if you disengage from extremist activities',
  ),
  questionBox(
    qText:
        'If you were to decide to change, what would you have to do to make that happen?',
  ),
  questionBox(
    qText:
        'What is the BEST thing you could imagine that could result from changing?',
  ),
  questionBox(
    qText: 'What can you do to avoid urges?',
  ),
  questionBox(
    qText:
        'What positive things occurred during your time in the movement, and how can those positive things be achieved or gained outside extremism?',
  ),
];

class exerciseBox extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      width: MediaQuery.of(context).size.width * .70,
      color: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: new Column(children: [
            new Align(
                alignment: Alignment.topCenter,
                child: new Column(
                  children: [
                    new Text(
                      "Exercises",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    new Text(
                      "Choose a question",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            new Container(
              height: MediaQuery.of(context).size.height * .37,
              width: MediaQuery.of(context).size.width * .68,
              child: new SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: new Align(
                      alignment: Alignment.centerLeft,
                      child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(children: questions)))),
            )
          ]),
          padding: EdgeInsets.all(5.0)),
    );
  }
}

