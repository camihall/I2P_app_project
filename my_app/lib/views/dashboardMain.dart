import 'package:flutter/material.dart';
import 'package:my_app/components/Calendar.dart';
import '../components/DashboardHeader.dart';
import '../components/DashboardOptions.dart';
import '../components/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:my_app/responsive.dart';

class DashboardMain extends StatelessWidget {
  const DashboardMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20),
                          if (!Responsive.isDesktop(context))
                            IconButton(
                              icon: const Icon(Icons.menu),
                              iconSize: 40,
                              onPressed:
                                  context.read<MenuController>().controlMenu,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 50),
                          if (!Responsive.isDesktop(context))
                            const SizedBox(width: 55),
                          const Text("You have 2 tasks today",
                              style: TextStyle(
                                  color: Color(0xff0B3F24),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20)),
                        ],
                      )
                    ],
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: const DashboardOptions(),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: SizedBox(
                              width: 600,
                              height: 500,
                              child: Container(
                                padding: const EdgeInsets.all(50),
                                child: const Card(
                                  child: Calendar(),
                                ),
                              )),
                        ),
                        Expanded(
                          child: SizedBox(
                              width: 600,
                              height: 500,
                              child: Container(
                                padding: const EdgeInsets.all(50),
                                child: const Card(),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
