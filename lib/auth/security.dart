import 'package:cardspace/Navigation/MenuScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'local_auth.dart';

class Security extends StatefulWidget {
  const Security({Key key}) : super(key: key);

  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  Future<void> _authorize() async {
    final isAuthenticated = await LocalAuthApi.authenticate();

    if (isAuthenticated) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MenuScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Card Space',
              style: GoogleFonts.patuaOne(
                  fontSize: MediaQuery.of(context).size.width * 0.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Icon(
              Icons.lock,
              size: MediaQuery.of(context).size.width * 0.1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Locked',
              style: GoogleFonts.roboto(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            GestureDetector(
              child: Icon(
                Icons.fingerprint,
                size: MediaQuery.of(context).size.width * 0.1,
              ),
              onTap: _authorize,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Tap to authenticate fingerprint',
              style: GoogleFonts.roboto(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
