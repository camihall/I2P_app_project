import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:my_app/responsive.dart';

import 'package:my_app/state/appState.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../components/DashboardHeader.dart';
import '../components/DashboardOptions.dart';
import '../components/MenuController.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  const Dashboard({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      runInitTasks();
    });
  }

  @protected
  Future runInitTasks() async {
    await store.dispatch(getFirebaseUser);
  }

  bool _anyAreNull() {
    final data = store.state.userData!;

    return data['name'] == null || data['email'] == null || data['dob'] == null;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _DashboardViewModel>(
        converter: _DashboardViewModel.fromStore,
        builder: (BuildContext context, _DashboardViewModel vm) {
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
                                              const Text("Welcome",
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
                                              const Text("You have 2 tasks today",
                                                  style: TextStyle(
                                                      color: Color(0xff0B3F24),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 20)),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 50, right: 50),
                                  child: const DashboardOptions(),
                                )
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

class _DashboardViewModel {
  final Map<String, dynamic> userData;

  _DashboardViewModel({required this.userData});

  static _DashboardViewModel fromStore(Store<AppState> store) {
    return _DashboardViewModel(userData: store.state.userData!);
  }
}
