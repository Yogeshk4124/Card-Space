import 'dart:async';

import 'package:cardspace/auth/security.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Security(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icon.png',
            width: MediaQuery.of(context).size.width * .7,
            // height: MediaQuery.of(context).size.height * .5,
            fit: BoxFit.fitWidth,
          ),
          Text(
            'Makes your life easier',
            style: GoogleFonts.sacramento(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: MediaQuery.of(context).size.width * .09,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
