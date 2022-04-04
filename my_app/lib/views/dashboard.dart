import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/state/appState.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Text(store.state.userData!['uid']),
        Text(store.state.userData!['name']),
        Text(store.state.userData!['dob']),
        Text(store.state.userData!['email']),
        Text(store.state.userData!['user_type']),
      ],
    )));
  }
}
