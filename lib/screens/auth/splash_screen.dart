import 'package:dexkorchatapp/main.dart';
import 'package:dexkorchatapp/screens/auth/login_screen.dart';
import 'package:dexkorchatapp/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1400),(){
      //exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      //Navigate to home screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const SignupScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {

    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to DexKor WeChat'),    
    ),
    body: Stack(children: [
      Positioned(

        top:mq.height*0.15, 
        width:mq.width*0.5,
        right:  mq.width*0.25,
        child: Image.asset("assets/images/icon.png")),
        
        Positioned(
        bottom:mq.height*0.15, 
        width:mq.width,
        
        height: mq.height*0.06,
        child: const Text('DexKor Chat App 🤩',
        textAlign:TextAlign.center,
         style: TextStyle(
          fontSize: 16,color: Colors.black87,
          letterSpacing: .5,
        ),)
        ),
         ]),
    );
  }
}

