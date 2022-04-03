import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'views/landing.dart';
import 'package:my_app/auth/login.dart';
import 'package:my_app/auth/registration.dart';
import 'package:my_app/views/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'state/appState.dart';

void main() {
  // Create your store as a final variable in the main function or inside a
  // State object. This works better with Hot Reload than creating it directly
  // in the `build` function.

  runApp(App(
    title: 'I2P App',
    store: store,
  ));
}

class App extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  const App({Key? key, required this.store, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: title,
          initialRoute: '/',
          routes: {
            '/': (context) => const LandingPage(),
            '/login': (context) => const Login(),
            '/registration': (context) => Registration(user: FirebaseAuth.instance.currentUser),
            '/dashboard': (context) => Dashboard(user: FirebaseAuth.instance.currentUser) 
          }),
    );
  }
}