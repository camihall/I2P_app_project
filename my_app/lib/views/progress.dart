import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/components/ProgressStreakCard.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:my_app/responsive.dart';

import 'package:my_app/state/appState.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../components/DashboardHeader.dart';
import '../components/DashboardOptions.dart';
import '../components/MenuController.dart';
import '../components/ProgressBarChart.dart';

// // ignore: must_be_immutable
class ProgressRoute extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  const ProgressRoute({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ProgressRoute();
}

class _ProgressRoute extends State<ProgressRoute> {
  List<int> mood_count = [1, 8, 3, 7, 12, 5];
  @override
  void initState() {
    super.initState();
  }

  bool _anyAreNull() {
    final data = store.state.userData!;

    return data['name'] == null || data['email'] == null || data['dob'] == null;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ProgressRouteViewModel>(
        converter: _ProgressRouteViewModel.fromStore,
        builder: (BuildContext context, _ProgressRouteViewModel vm) {
          if (_anyAreNull()) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            key: context.read<MenuController>().scaffoldKey,
            drawer: const SideMenu(),
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
                                          const Text("Progress Tracker",
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
                            // Container(
                            //     child:
                            Row(children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      SizedBox(width: 50),
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
                                    SizedBox(width: 50),
                                    ProgressStreakCard(
                                        title: "Current Streak", numdays: 10),
                                    SizedBox(width: 10),
                                    ProgressStreakCard(
                                        title: "Longest Streak", numdays: 24),
                                  ]),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(width: 50),
                                      ProgressStreakCard(
                                        title: "Journal Entries",
                                        numdays: 30,
                                      ),
                                      SizedBox(width: 10),
                                      ProgressStreakCard(
                                        title: "Guided Questions",
                                        numdays: 35,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      SizedBox(width: 50),
                                      Text(
                                        "Monthly Mood Tracker",
                                        style: TextStyle(
                                            color: Color(0xff0B3F24),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(width: 30),
                                      Card(
                                          elevation: 3,
                                          child: InkWell(
                                              splashColor:
                                                  const Color(0xffB1CEBF),
                                              onTap: () {
                                                debugPrint('Card tapped.');
                                              },
                                              child: Container(
                                                // padding: const EdgeInsets.all(defaultPadding),
                                                width: 450,
                                                height: 270,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    MoodTrackerBar(title: '',)
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
                            ])

                            // )
                          ],
                        ),
                      ),
                    ))
              ],
            )),
          );
        });
  }
}

class _ProgressRouteViewModel {
  final Map<String, dynamic> userData;

  _ProgressRouteViewModel({required this.userData});

  static _ProgressRouteViewModel fromStore(Store<AppState> store) {
    return _ProgressRouteViewModel(userData: store.state.userData!);
  }
}

// import 'package:flutter/material.dart';

// class ProgressRoute extends StatelessWidget {
//   const ProgressRoute({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome to Flutter'),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
