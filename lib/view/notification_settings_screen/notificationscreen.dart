
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _scaffoldBody(),
      ),
    );
  }

  Widget  _scaffoldBody(){
    return Column(
      children: [
        _title(),
        _settingsScreen()
      ],
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Settings Screen',
        style: TextStyle(
            fontSize: 21.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _settingsScreen(){
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        color: Colors.black12,
        height: MediaQuery.of(context).size.height / 3.2,
        width: MediaQuery.of(context).size.width/1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _notificationText(),
            _notificationtemplate(),
            _notificationtemplate2(),
            _notificationtemplate3()
          ],
        ),
      ),
    );
  }

  Widget _notificationText() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Notification Settings',
        style: TextStyle(
            fontSize: 21.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _notificationtemplate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Text(
              'Email Notification',
              style: TextStyle(
                  fontSize: 21.0, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 90,),
            FlutterSwitch(
              activeText: "ON",
              inactiveText: "OFF",
              activeTextColor: Colors.red,
              width: 70.0,
              height: 35.0,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
              value: status,
              valueFontSize: 15.0,
              toggleSize: 26.0,
              showOnOff: true,
              activeColor: Colors.grey,


            )

          ],
        ),
      ),
    );
  }

  Widget _notificationtemplate2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Push Notification',
            style: TextStyle(
                fontSize: 21.0, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 90,),
          FlutterSwitch(
            activeText: "ON",
            inactiveText: "OFF",
            activeTextColor: Colors.red,
            width: 70.0,
            height: 35.0,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
            value: status,
            valueFontSize: 15.0,
            toggleSize: 26.0,
            showOnOff: true,
            activeColor: Colors.grey,


          )
        ],
      ),
    );
  }


  Widget _notificationtemplate3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Notification at night',
            style: TextStyle(
                fontSize: 21.0, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 70,),
          FlutterSwitch(
            activeText: "ON",
            inactiveText: "OFF",
            activeTextColor: Colors.red,
            width: 70.0,
            height: 35.0,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
            value: status,
            valueFontSize: 15.0,
            toggleSize: 26.0,
            showOnOff: true,
            activeColor: Colors.grey,


          )
        ],
      ),
    );
  }
}
