import 'package:careconnect/app_constants.dart';
import 'package:careconnect/realtime-chart3.dart';
import 'package:careconnect/realtime_chart2.dart';
import 'package:flutter/material.dart';

import 'pulsar_configuration_widget.dart';
import 'realtime_chart.dart';

class PulsarScreen extends StatefulWidget {
 
  @override
  _PulsarScreenState createState() => _PulsarScreenState();
}

class _PulsarScreenState extends State<PulsarScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColorDark,
      appBar: AppBar(
        title: Text("careconnect"),
        backgroundColor: kBackgroundColor,
      ),
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Heart Rate",style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),),
            Container(height: 150, child: RealtimeChart()),
            SizedBox(
              height: 10,
            ),
            Text("Diastolic Blood Pressure",style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),),
            Container(height: 150, child: RealtimeChart2()),
            SizedBox(
              height: 10,
            ),
            Text("Systolic Blood Pressure",style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),),
            Container(height: 150, child: RealtimeChart3()),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
