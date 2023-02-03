import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vtu_flutter/screens/home.dart';
import 'package:vtu_flutter/screens/main_page.dart';
import 'package:vtu_flutter/screens/profile.dart';
import 'package:vtu_flutter/screens/register.dart';
import 'package:vtu_flutter/screens/top_up.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Register(),
    );
  }
}
