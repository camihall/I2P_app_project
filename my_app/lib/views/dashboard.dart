import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  User? user;
  Dashboard({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? name = "";

  @override
  void initState() {
    if (widget.user != null) {
      name = widget.user?.displayName;
      print(name);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Text("Sup"),
    ));
  }
}
