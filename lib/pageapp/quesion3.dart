import 'dart:ffi';

import 'package:estimation_gym/bmi/bmi.dart';
import 'package:estimation_gym/checkbox/checkbox_stage.dart';
import 'package:estimation_gym/pageapp/questions4.dart';
import 'package:flutter/material.dart';

class Question3Widget extends StatefulWidget {
  const Question3Widget({Key? key}) : super(key: key);

  @override
  _Question3WidgetState createState() => _Question3WidgetState();
}

class _Question3WidgetState extends State<Question3Widget> {
  get child => null;
  final groupday = CheckboxStage(title: "Eveyday");

  final Day = [
    CheckboxStage(title: "Sunday"),
    CheckboxStage(title: "Monday"),
    CheckboxStage(title: "Tuesday"),
    CheckboxStage(title: "Wednesday"),
    CheckboxStage(title: "Thurday"),
    CheckboxStage(title: "Friday"),
    CheckboxStage(title: "Saturday")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //พื้นหลัง
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("image/bg.jpg"),
        fit: BoxFit.cover,
      )),
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(150, 3, 4, 55),
          child: Center(
              child: Container(
            width: 500,
            height: 600,
            margin: EdgeInsets.only(top: 90, left: 10, right: 10, bottom: 60),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            padding: EdgeInsets.only(top: 50),
            child: Column(children: [
              Text("What days would you like to exercise?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  )),
              //  Padding(padding: EdgeInsets.only(top: 170)),
              ...Day.map(BuilSingleCheckbox).toList(),
              BuilGrupCheckbox(groupday),
              //--------------button
              Row(
                children: [
                  // back
                  Container(
                    child: Actions(
                      actions: {},
                      child: Container(
                          margin: EdgeInsets.only(left: 150),
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BmiPage()),
                                );
                              },
                              child: Text("Back"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 255, 255, 255),
                                  onPrimary: Colors.black,
                                  textStyle: TextStyle(fontSize: 20)),
                            ),
                          )),
                    ),
                  ),

                  //Button---> Next

                  Container(
                    child: Actions(
                      actions: {},
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Question4Widget()),
                                );
                              },
                              child: Text("Next"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 253, 214, 38),
                                  onPrimary: Colors.black,
                                  textStyle: TextStyle(fontSize: 20)),
                            ),
                          )),
                    ),
                  ),
                ],
              )
            ]),
          )),
        ),

        /* Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 170)),
            ...Day.map(BuilSingleCheckbox).toList(),
            BuilGrupCheckbox(groupday),
          ],
        ),*/
      ]),
    ));
  }

  @override
  Widget BuilSingleCheckbox(CheckboxStage checkBox) => CheckboxListTile(
        value: checkBox.value,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.only(left: 70),
        title: Text(checkBox.title),
        onChanged: (value) => setState(() {
          checkBox.value = value!;
        }),
      );
  Widget BuilGrupCheckbox(CheckboxStage checkBox) => CheckboxListTile(
        value: checkBox.value,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.only(left: 70),
        title: Text(checkBox.title),
        onChanged: toggleGroupCheckbox,
      );

  void toggleGroupCheckbox(bool? value) {
    if (value == null) return;

    setState(() {
      groupday.value = value;
      Day.forEach((Day) => Day.value = value);
    });
  }
}
