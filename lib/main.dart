import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rickandmorty/screens/auth/signup.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'screens/homePage.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    RootRestorationScope(
      restorationId: "restore",
          child: GetMaterialApp(home:
       FirebaseAuth.instance.currentUser != null
              ?
        HomePage():
       SignUp(),),
    )
    // MyApp())
   ) ;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: HomePage()
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
