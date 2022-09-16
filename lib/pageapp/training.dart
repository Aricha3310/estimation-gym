import 'package:estimation_gym/model/InformationModel.dart';
import 'package:estimation_gym/provider/informationProvide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Trainging extends StatefulWidget {
  const Trainging({Key? key}) : super(key: key);

  @override
  _Training createState() => _Training();
}

class _Training extends State<Trainging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          //พื้นหลัง
          decoration: BoxDecoration(color: Colors.black),

          //กล่อง
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 400),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("image/ex.jpg"),
                      fit: BoxFit.cover,
                    )),
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color.fromARGB(197, 29, 29, 52),
                    child: Center(
                      child: Text(
                        "Basic Aerobic",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 250, left: 10, right: 10),
                child: Consumer(
                    builder: (context, InformationProvide provider, child) {
                  return ListView.builder(
                      itemCount: provider.informations.length,
                      itemBuilder: (context, int index) {
                        InformationModel data = provider.informations[index];
                        return Card(
                          child: ListTile(
                            title: Text(data.Sex),
                            subtitle: Text(data.hight),
                            leading: Icon(
                              Icons.access_time,
                              size: 40,
                            ),
                          ),
                        );
                      });
                }),
              )
            ],
          )),
    ]));
  }
}
/*Consumer(builder: (context, InformationProvide provider, child) {
        return ListView.builder(
            itemCount: provider.informations.length,
            itemBuilder: (context, int index) {
              return Card(
                child: ListTile(title: Text("data")),
              );
            });
      }),*/