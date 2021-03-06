import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/pages/loginpage.dart';
import 'pages/home.dart';



StreamController<int> streamController = StreamController();

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(home: Home(stream: streamController.stream,));
    return MaterialApp(home: LoginPage(),);
  }
}
