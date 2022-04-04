import 'package:flutter/material.dart';

class exercises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Exercises',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('New Page'),
            backgroundColor: new Color(0xFF0B3F24),
          ),
          body: exerciseAll()),
    );
  }
}

class exerciseAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 300.0,
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: new Center(
                        child: new Text(
                          "Exercise #1",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
                Container(
                    height: 150.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: new Center(
                      child: new Text(
                        "Exercise #2",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ))));
    throw UnimplementedError();
  }
}
