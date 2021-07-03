import 'package:cardspace/Cards/cCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class identificationcards extends StatefulWidget {
  @override
  _identificationcardsState createState() => _identificationcardsState();
}

class _identificationcardsState extends State<identificationcards> {
  List<cCard> debitCards;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff3450A1),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Text(
                  "Identification Cards",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.square_stack_3d_up_slash_fill,
                      size: MediaQuery.of(context).size.width * .30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'No Identification Card Found',
                      style: GoogleFonts.courierPrime(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
