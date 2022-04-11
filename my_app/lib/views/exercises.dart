import 'package:flutter/material.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:provider/provider.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import '../responsive.dart';
import 'NavBar.dart';

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
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new exerciseBox("Exercise 1"),
            new exerciseBox("Exercise 2"),
          ]),
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new exerciseBox("Exercise 3"),
            new exerciseBox("Exercise 4"),
          ]),
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new exerciseBox("Exercise 5"),
            new exerciseBox("Exercise 6"),
          ])
    ]);
  }
}

class exerciseBox extends StatelessWidget {
  exerciseBox(this.exerciseName);
  String exerciseName;

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => exercises()),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .25,
          width: MediaQuery.of(context).size.width * .20,
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text(
                  exerciseName,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              )),
        ));
  }
}
