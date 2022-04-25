// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:my_app/responsive.dart';

import '../components/ProgressBarChart.dart';
import '../components/ProgressCountCard.dart';
import '../components/ProgressStreakCard.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);

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
                          const Text("Progress Tracker",
                              style: TextStyle(
                                  color: Color(0xff0B3F24),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 50),
                          if (!Responsive.isDesktop(context))
                            const SizedBox(width: 55),
                          const Text("Continue to grow.",
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
                child: Row(children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Overview",
                            style: TextStyle(
                                color: Color(0xff0B3F24),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(children: [
                        SizedBox(width: 150),
                        ProgressStreakCard(
                            title: "Current Streak", numdays: 10),
                        SizedBox(width: 10),
                        ProgressStreakCard(
                            title: "Longest Streak", numdays: 24),
                      ]),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150),
                          ProgressCountCard(
                              title: "Journal Entries", numdays: 30)
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 150),
                          ProgressCountCard(
                              title: "Guided Questions", numdays: 35)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 50),
                          Card(
                              elevation: 3,
                              child: InkWell(
                                  splashColor: const Color(0xffB1CEBF),
                                  onTap: () {
                                    debugPrint('Card tapped.');
                                  },
                                  child: Container(
                                    // padding: const EdgeInsets.all(defaultPadding),
                                    width: 600,
                                    height: 450,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(height: 5),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 5),
                                            Text(
                                              "Monthly Mood Tracker",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xff0B3F24),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        MoodTrackerBar(
                                          title: '',
                                        )
                                        // SizedBox(height: 10),
                                        // Container(
                                        //   width: 100,
                                        //   height: 80,
                                        //   decoration:
                                        //       const BoxDecoration(
                                        //     borderRadius:
                                        //         BorderRadius.all(
                                        //             Radius.circular(
                                        //                 10)),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ))),
                          // );
                        ],
                      )
                    ],
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
