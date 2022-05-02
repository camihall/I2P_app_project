import 'package:flutter/material.dart';


class ProgressStreakCard extends StatelessWidget {
  String title;
  int numdays;
  ProgressStreakCard({Key? key, required this.title, required this.numdays})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 3,
          child: InkWell(
              splashColor: const Color(0xffB1CEBF),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: SizedBox(
                // padding: const EdgeInsets.all(defaultPadding),
                width: 100,
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        numdays.toString(),
                        style: TextStyle(
                            color: Color(0xff0B3F24),
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(title!,
                        style: TextStyle(
                            color: Color(0xff0B3F24),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center),
                  ],
                ),
              ))),
    );
  }
}
