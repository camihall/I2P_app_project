import 'package:flutter/material.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:provider/provider.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import '../responsive.dart';

class SOSRoute extends StatelessWidget{
  const SOSRoute({Key? key}) : super(key: key);

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
                                      const Text("Help Contact Resources",
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
                          child: MyDataTable(),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
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