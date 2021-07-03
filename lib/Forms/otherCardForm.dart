import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class otherCardForm extends StatefulWidget {
  dynamic sideMenuKey;

  otherCardForm({@required this.sideMenuKey});
  @override
  _otherCardFormState createState() => _otherCardFormState();
}

class _otherCardFormState extends State<otherCardForm> {
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
                    iconSize: 25,
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      final _state = widget.sideMenuKey.currentState;
                      if (_state.isOpened)
                        _state.closeSideMenu();
                      else
                        _state.openSideMenu();
                    }),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Add Card',
                  style: GoogleFonts.roboto(fontSize: 22),
                )
              ],
            ),
            Expanded(
                child: Icon(
              CupertinoIcons.burn,
              size: 200,
              color: Colors.red,
            )),
            Expanded(
                child: Text(
              'Feature not implemented yet',
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
