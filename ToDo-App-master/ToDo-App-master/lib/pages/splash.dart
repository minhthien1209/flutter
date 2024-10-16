import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapps/pages/login.dart';
import 'package:todoapps/pages/onbording.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required String title});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const OnBording(
                   
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 161, 168, 188),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logoo.png",
              height: 100,
            ),
            const SizedBox(
              height: 70,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 119, 172, 215)),
            )
          ],
        ),
      ),
    );
  }
}
