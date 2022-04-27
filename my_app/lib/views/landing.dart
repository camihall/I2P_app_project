import 'package:flutter/material.dart';
import '../utils/widgets.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: AlignmentDirectional.topStart,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/loginbg.png"),
          fit: BoxFit.fill,
          repeat: ImageRepeat.repeatY,
        ), /*color: Color(0xFFE0ECE6)*/
      ),
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            // Top Header
            Padding(
              padding: EdgeInsets.only(left: 150.0, top: 20, right: 150),
              child: HeaderWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 150.0, top: 0, right: 150),
                child : LandingDescription(),
                
            ),
          ],
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
