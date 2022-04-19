import 'package:flutter/material.dart';

class SOSRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS'),
      ),
      body: const MyDataTable(),
    );
  }
}

class MyDataTable extends StatelessWidget {
  const MyDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Contact Name')),
        DataColumn(label: Text('Number')),
        //DataColumn(lable: icon(phone)),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Website')),
        DataColumn(label: Text('Description')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('Parents For Peace')),
          DataCell(Text('1-844-49-PEACE')),
          DataCell(Text('info@parents4peace.org')),
          DataCell(Text('https://www.parents4peace.org/')),
          DataCell(Text('If you or anyone you know is struggling with extremism, we are here to help')),
        ]),
        DataRow(cells: [
          DataCell(Text('BetterHelp')),
          DataCell(Text('')),
          DataCell(Text('contact@betterhelp.com')),
          DataCell(Text('https://www.betterhelp.com')),
          DataCell(Text('BetterHelp will match you to a licensed therapists whom you can get feedback, advice and guidance from.')),
        ]),
      ],
    );
  }
}