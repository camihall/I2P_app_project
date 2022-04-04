import 'package:flutter/material.dart';

class StepsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'About the SMART Recovery Plan',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('About the SMART Recovery Plan'),
            backgroundColor: Colors.green,
          ),
          body: const StepsList()),
    );
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
