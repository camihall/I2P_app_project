// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import '../responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class SOSRoute extends StatelessWidget {
  const SOSRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                      child: const MySquares(),
                    )
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}

class MySquares extends StatelessWidget {
  const MySquares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          InkWell(
              onTap: () async {
                const url = "https://beyondbarriersusa.org/";
                if (await canLaunch(url)) {
                  await launch(
                    url,
                  );
                }
              },
              splashColor: Colors.white10,
              child: Ink.image(
                image: const AssetImage("assets/images/beyondbarriers.png"),
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width * .45,
              )),
          const Text("Beyond Barriers"),
          InkWell(
              onTap: () async {
                const url = "https://www.pnetworks.org/";
                if (await canLaunch(url)) {
                  await launch(
                    url,
                  );
                }
              },
              splashColor: Colors.white10,
              child: Ink.image(
                image: const AssetImage("assets/images/pnetworks.png"),
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width * .45,
              )),
          const Text("Parallel Networks"),
          InkWell(
              onTap: () async {
                const url = "https://www.miraclecourt.com/";
                if (await canLaunch(url)) {
                  await launch(
                    url,
                  );
                }
              },
              splashColor: Colors.white10,
              child: Ink.image(
                image: AssetImage("assets/images/mcourt.png"),
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width * .45,
              )),
          const Text("Miracle Court"),
          InkWell(
              onTap: () async {
                const url = "http://www.savingcain.org/";
                if (await canLaunch(url)) {
                  await launch(
                    url,
                  );
                }
              },
              splashColor: Colors.white10,
              child: Ink.image(
                image: AssetImage("assets/images/savingcain.jpeg"),
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width * .45,
              )),
          const Text("SavingCain.org"),
        ],
      ),
    );
  }
}
