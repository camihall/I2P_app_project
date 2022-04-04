import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/auth/authentication.dart';
import 'package:my_app/state/appState.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
              body: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),

                                CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(getCurrentUser()!.photoURL!),
                                ),
                                Text(vm.userData['name'],
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(vm.userData['email'],
                                    style: const TextStyle(
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        letterSpacing: 1.5)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(vm.userData['dob'],
                                    style: const TextStyle(
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        letterSpacing: 1.5)),
                              ])
                        ],
                      ))));
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
