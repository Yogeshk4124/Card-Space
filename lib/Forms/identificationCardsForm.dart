import 'package:cardspace/Cards/cCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../CardClasses/mCard.dart';

class identificationCardsForm extends StatefulWidget {
  @override
  _identificationCardsFormState createState() => _identificationCardsFormState();
}

class _identificationCardsFormState extends State<identificationCardsForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Add Identification Card',
                  style: GoogleFonts.roboto(fontSize: 22),
                )
              ],
            ),
            Expanded(child:Icon(CupertinoIcons.burn,size:200,color: Colors.red,)),
            Expanded(child:Text('Feature not implemented yet',style: TextStyle(fontSize: 20),)),
          ],
        ),
      ),
    );
  }
}
