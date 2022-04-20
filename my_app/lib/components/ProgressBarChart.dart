import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MoodTrackerBar(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class MoodTrackerBar extends StatefulWidget {
  MoodTrackerBar({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MoodTrackerBarState createState() => _MoodTrackerBarState();
}

class _MoodTrackerBarState extends State<MoodTrackerBar> {
  late List<MoodData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        height: 400,
        child: Scaffold(
            body: SfCartesianChart(
          // plotAreaBackgroundColor: Color(0xff0B3F24),
          // title: ChartTitle(text: 'Monthly Mood Tracker'),
          // legend: Legend(isVisible: true),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            ColumnSeries<MoodData, String>(
                color: Color(0xffB1CEBF),
                // name: 'Mood',
                dataSource: _chartData,
                xValueMapper: (MoodData Mood, _) => Mood.Mood,
                yValueMapper: (MoodData Mood, _) => Mood.MoodCount,
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(
                        color: Color(0xff0B3F24),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)))
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
            // title: AxisTitle(text: 'Mood in billions of U.S. Dollars')),
          ),
          // )
        )));
  }

  List<MoodData> getChartData() {
    final List<MoodData> chartData = [
      MoodData('Happy', 1),
      MoodData('Content', 8),
      MoodData('Neutral', 3),
      MoodData('Sad', 7),
      MoodData('Frustrated', 12),
      MoodData('Angry', 5),
    ];
    return chartData;
  }
}

class MoodData {
  MoodData(this.Mood, this.MoodCount);
  final String Mood;
  final int MoodCount;
}
