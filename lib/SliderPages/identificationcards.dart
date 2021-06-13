
import 'package:cardspace/CardClasses/mCard.dart';
import 'package:cardspace/Cards/cCard.dart';
import 'package:cardspace/Sliders/CreditCardSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class identificationcards extends StatefulWidget {
  dynamic sideMenuKey;

  identificationcards({@required this.sideMenuKey});

  @override
  _identificationcardsState createState() => _identificationcardsState();
}

class _identificationcardsState extends State<identificationcards> {
  List<cCard> debitCards ;
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
            Icon(CupertinoIcons.burn,color: Colors.red,),
            Text('Feature not implemented yet'),
          ],
        ),
      ),
    );
  }
}
