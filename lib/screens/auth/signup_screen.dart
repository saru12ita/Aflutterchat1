import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dexkorchatapp/screens/auth/login_screen.dart'; // Ensure this import is correct
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  void _handleGoogleBtnClick() async {
    try {
      UserCredential userCredential = await _signupWithGoogle();
      print('User: ${userCredential.user}');
      print('UserAdditionalInfo: ${userCredential.additionalUserInfo}');
      
      // Test navigation with a simple container
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Container(color: Colors.red, child: Center(child: Text("Test Page")))),
      );

      // If the test works, then uncomment the line below
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));

    } catch (e) {
      print('Error during Google sign-in: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in with Google: $e')),
      );
    }
  }

  Future<UserCredential> _signupWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw Exception("Google sign-in aborted");
    }
    
    final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context); // Ensure MediaQuery is correctly defined

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to DexKor WeChat'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: mq.size.height * 0.15,
            width: mq.size.width * 0.5,
            right: _isAnimate ? mq.size.width * 0.25 : mq.size.width * 0.5,
            duration: const Duration(seconds: 1),
            child: Image.asset("assets/images/icon.png"),
          ),
          Positioned(
            bottom: mq.size.height * 0.15,
            width: mq.size.width * 0.6,
            left: mq.size.width * 0.20,
            height: mq.size.height * 0.06,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 92, 204),
                shape: const StadiumBorder(),
                elevation: 3,
              ),
              onPressed: _handleGoogleBtnClick,
              icon: Image.asset("assets/images/google.png", height: mq.size.height * 0.03),
              label: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(text: 'Register With\t'),
                    TextSpan(text: 'Google', style: TextStyle(fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
