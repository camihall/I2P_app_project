import 'package:flutter/material.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:provider/provider.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import '../responsive.dart';

class StepsRoute extends StatelessWidget {
  const StepsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SafeArea(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 20),
                                      if (!Responsive.isDesktop(context))
                                        IconButton(
                                          icon: const Icon(Icons.menu),
                                          iconSize: 40,
                                          onPressed: context
                                              .read<MenuController>()
                                              .controlMenu,
                                        ),
                                      const SizedBox(width: 30),
                                      const Text("About",
                                          style: TextStyle(
                                              color: Color(0xff0B3F24),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40)),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: RichText(
                            text: TextSpan(
                              text: '',
                              style: TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                                TextSpan(text: '4 Points of our SMART Recovery Plan Based Program\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                                TextSpan(
                                  text: 
'''\n1. Building and maintaining the motivation to change.
2. Coping with urges to participate in extremist activities.
3. Managing thoughts, feelings, and behaviors in an effective way without addictive behaviors.
4. Living a balanced, positive, and healthy life.''', 
                                  style: TextStyle(fontSize: 16)),
                                TextSpan(text: '\n\n\nWhat is the SMART Recovery Plan?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                                TextSpan(
                                  text: 
'''\n\nSelf-Management and Recovery Training (SMART) is a support 
program for people with addictions and behavioral disorders. It 
teaches people how to control their addictive behavior by focusing 
on underlying thoughts and feelings. Participants in SMART learn skills 
to manage their cravings and urges for the long term. SMART proposes a 
4-point program. Participants can tackle a specific point in any order 
based on their needs.''', 
                                  style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}

class StepsList extends StatelessWidget {
  const StepsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final steps = stepslst;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: steps.map((step) {
          return Card(
            child: ListTile(
              title: Text(step.stepnum, style: textTheme.headline4),
              subtitle: Text(step.steptxt),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}

class Steps {
  const Steps({
    required this.steptxt,
    required this.stepnum,
  });
  final String steptxt;
  final String stepnum;
}

const stepslst = [
  Steps(
      steptxt: 
           "Building and maintaining the motivation to change.",
      stepnum: "Point 1"),
  Steps(
      steptxt:
          "Coping with urges to participate in extremist activities.",
      stepnum: "Point 2"),
  Steps(
      steptxt:
          "Managing thoughts, feelings, and behaviors in an effective way without addictive behaviors.",
      stepnum: "Pint 3"),
  Steps(
      steptxt:
          "Living a balanced, positive, and healthy life.",
      stepnum: "Point 4"),
];

// const stepslst = [
//   Steps(
//       steptxt:
//           "We admit that we are powerless about our feeling of hate and that our lives have become unmanageable.",
//       stepnum: "Step 1"),
//   Steps(
//       steptxt:
//           "We came to believe that we need outside help to restore sanity.",
//       stepnum: "Step 2"),
//   Steps(
//       steptxt:
//           "We have decided to change our feelings, thoughts and actions to heal from past pain.",
//       stepnum: "Step 3"),
//   Steps(
//       steptxt:
//           "We are ready to confront with ourself and question about our past actions.",
//       stepnum: "Step 4"),
//   Steps(
//       steptxt:
//           "We are ready to empathize with people for whom we have caused suffering in the past and present.",
//       stepnum: "Step 5"),
//   Steps(steptxt: "We are ready to admit our mistakes.", stepnum: "Step 6"),
//   Steps(
//       steptxt:
//           "We are ready to build an identity that is separate from our former extremist communities.",
//       stepnum: "Step 7"),
//   Steps(
//       steptxt: "We are ready to recognize the new version of ourselves.",
//       stepnum: "Step 8"),
//   Steps(
//       steptxt:
//           "We are ready to track our growth process and be held accountable for future mistakes.",
//       stepnum: "Step 9"),
//   Steps(
//       steptxt:
//           "We are ready to be thankful for the life we have and be proud of ourselves.",
//       stepnum: "Step 10"),
// ];