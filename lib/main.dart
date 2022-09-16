import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimation_gym/bmi/bmi.dart';
import 'package:estimation_gym/pageapp/craete_account.dart';
import 'package:estimation_gym/pageapp/farmer.dart';
import 'package:estimation_gym/state/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final Map<String, WidgetBuilder> map = {
  '/Farmer': (BuildContext context) => const Farmer(),
  '/Craeteaccount': (BuildContext context) => const Craeteaccount(),
  '/MyHome': (BuildContext context) => const BmiPage(),
};

String? initlalRoute;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        String uid = event.uid;
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .snapshots()
            .listen((event) {
          initlalRoute = MyConstant.routeBmiPage;
          runApp(const MyApp());
        });
      } else {
        initlalRoute = MyConstant.routeFarmer;
        runApp(const MyApp());
      }
    });
  });
  WidgetsFlutterBinding.ensureInitialized();

  const AndroidInitializationSettings initializationSettingsAndtoid =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndtoid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyConstant.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
