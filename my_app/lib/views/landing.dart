import 'package:flutter/material.dart';
import '../utils/widgets.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Top Header
            const Padding(
              padding: EdgeInsets.only(left: 150.0, top: 20, right: 150),
              child: HeaderWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150.0, top: 0, right: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  LandingDescription(),
                ],
              ),
            ),
          ],
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
