import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:my_app/responsive.dart';

import 'package:my_app/state/appState.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
    const routerKey = GlobalObjectKey('auth_router');
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
            drawer: SideMenu(
              context: context,
            ),
            body: SafeArea(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // We want this side menu only for large screen
                if (Responsive.isDesktop(context))
                  Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: SideMenu(
                      context: context,
                    ),
                  ),
                const Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: AutoRouter(key: routerKey))
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
