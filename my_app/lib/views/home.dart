import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'NavBar.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME')
      ),
      body: Column(
	        children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                )
              ],),
            Row(
              children: [
                SizedBox(
                  width: 75,
                ),
                SizedBox(
                  height:25,
                  child: Text(
                    "Resources",
                    style: TextStyle(fontSize:15, fontWeight: FontWeight.bold, color: Colors.green))
                )
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              _buildButtonColumn(Icons.book, 'Curriculum'),
              _buildButtonColumn(Icons.brightness_low, 'Meditation'),
              _buildButtonColumn(Icons.brush, 'Journal'),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                )
              ],),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 75,
                    )
                  ],
                ),
                Column(
                  children:[
                    SizedBox(
                     height:25,
                     child: Text(
                      "Check In",
                      style: TextStyle(fontSize:15, fontWeight: FontWeight.bold, color: Colors.green))
                    ),
                    SizedBox(
                      // child: TableCalendar(
                      // ),
                    )
                  ]
                ),
    
                Column()
              ],)
	        ],
	    ),
    );
  }

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 70,
          child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  ),
                  onPressed: () {},
                  icon: Icon(
                          icon,
                          color:Colors.green,
                          size: 24.0,
                  ),
                  label: Text(label, style: TextStyle(color: Colors.green),),
          ),
        )
      ],
    );
  }
}
