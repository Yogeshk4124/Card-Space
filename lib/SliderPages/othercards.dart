import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class othercards extends StatefulWidget {
  dynamic sideMenuKey;

  othercards({@required this.sideMenuKey});

  @override
  _othercardsState createState() => _othercardsState();
}

class _othercardsState extends State<othercards> {
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
                      iconSize: 25,
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        final _state = widget.sideMenuKey.currentState;
                        if (_state.isOpened)
                          _state.closeSideMenu();
                        else
                          _state.openSideMenu();
                      }),
                ),
                Text("Others Cards",style: TextStyle(fontSize: 16),)
              ],
            ),
            Expanded(child:Icon(CupertinoIcons.burn,size:MediaQuery.of(context).size.width*0.5,color: Colors.red,)),
            Expanded(child:Text('Feature not implemented yet',style: TextStyle(fontSize: 20),)),
          ],
        ),
      ),
    );
  }
}
