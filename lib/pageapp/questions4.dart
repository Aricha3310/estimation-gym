import 'dart:ffi';
import 'package:estimation_gym/pageapp/history.dart';
import 'package:estimation_gym/pageapp/training.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart'; // TODO Implemen

class Question4Widget extends StatefulWidget {
  const Question4Widget({Key? key}) : super(key: key);

  @override
  _Question4WidgetState createState() => _Question4WidgetState();
}

class _Question4WidgetState extends State<Question4Widget> {
  // -----------ตัวแปร
  int currentIndex = 0;
  late String _title;

  //-----------navigatbar screen
  final screens = [
    Trainging(),
    History(),
    Center(
      child: Text("test3"),
    ),
    // EX Question4Widget();
  ];

  // case title appbar------------------------------------------
  initState() {
    _title = 'Training';
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Training';
          }
          break;
        case 1:
          {
            _title = 'History';
          }
          break;
        case 2:
          {
            _title = 'Contact';
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar-----------------------------------------------------
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Backup & Restore'),
              subtitle: Text("Sign in and synchronize your data"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.coffee),
              title: Text('Countdown Time'),
              onTap: () => _AlertReTime(context),
            ),
            ListTile(
              leading: Icon(Icons.restore),
              title: Text('Restart progress'),
              onTap: () => _AlertRestore(context),
            ),
          ],
        ),
      ),

      body: screens[currentIndex],
      //Navigat App
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: "Training",
            backgroundColor: Color.fromARGB(255, 196, 195, 195),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: "History",
              backgroundColor: Color.fromARGB(255, 196, 195, 195)),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Contact",
              backgroundColor: Color.fromARGB(255, 196, 195, 195))
        ],
      ),
    );
  }

  _AlertRestore(context) {
    Alert(
        context: context,
        title: "Restart progress",
        type: AlertType.warning,
        buttons: [
          DialogButton(
              child: Text("OK"), onPressed: () => Navigator.pop(context)),
          DialogButton(
              child: Text("Cancel"), onPressed: () => Navigator.pop(context))
        ]).show();
  }

  _AlertReTime(context) {
    Alert(
        context: context,
        title: "Set Duration (5~180 secs)",
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Countdown'),
              keyboardType: TextInputType.number,
            )
          ],
        ),
        buttons: [
          DialogButton(
              child: Text("OK"), onPressed: () => Navigator.pop(context)),
          DialogButton(
              child: Text("Cancel"), onPressed: () => Navigator.pop(context))
        ]).show();
  }
}
