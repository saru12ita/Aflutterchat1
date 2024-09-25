/*
import 'dart:ui';
import 'package:dexkorchatapp/screens/auth/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
late Size mq;
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((value)
    {
      /*
_initializeFirebase();
  runApp(const MyApp());
  */
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DexKor WeChat",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
         centerTitle: true,
         elevation: 8,
         iconTheme: IconThemeData(color:  Colors.black),
         titleTextStyle: TextStyle(
          color: Colors.black,fontWeight: FontWeight.normal,fontSize: 19
         ),
         backgroundColor: Colors.white,
        )
      ),
      home:const SplashScreen(),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}
*/

import 'package:dexkorchatapp/screens/auth/splash_screen.dart';
import 'package:flutter/material.dart';
late Size mq;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DexKor WeChat",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 8,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19,
          ),
          backgroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
