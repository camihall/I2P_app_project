import 'package:flutter/material.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:provider/provider.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import '../responsive.dart';

class SOSRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Resources',
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
                                      const Text("Additional Resources",
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
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: MySquares(),
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

class MySquares extends StatelessWidget {
  const MySquares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          Image.asset(
            "assets/images/beyondbarriers.png",
            height: MediaQuery.of(context).size.height * .45,
            width: MediaQuery.of(context).size.width * .45,
          ),
          Text("Beyond Borders"),
          Image.asset(
            "assets/images/officialLogo.png",
            height: MediaQuery.of(context).size.height * .45,
            width: MediaQuery.of(context).size.width * .45,
          ),
          Text("Parallel Networks"),
          Image.asset(
            "assets/images/officialLogo.png",
            height: MediaQuery.of(context).size.height * .45,
            width: MediaQuery.of(context).size.width * .45,
          ),
          Text("Miracle Court"),
          Image.asset(
            "assets/images/officialLogo.png",
            height: MediaQuery.of(context).size.height * .45,
            width: MediaQuery.of(context).size.width * .45,
          ),
          Text("SavingCain.org"),
        ],
      ),
    ));
  }
}
