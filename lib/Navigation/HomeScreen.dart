import 'package:cardspace/SliderPages/creditcard.dart';
import 'package:cardspace/SliderPages/debitcard.dart';
import 'package:cardspace/SliderPages/identificationcards.dart';
import 'package:cardspace/SliderPages/organizationcards.dart';
import 'package:cardspace/SliderPages/othercards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  dynamic sideMenuKey;

  HomeScreen({@required this.sideMenuKey});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List l = [
    'Credit Cards',
    'Debit Cards',
    'Identification Cards',
    'Organization Cards',
    'Other Cards'
  ];
  List icons = [
    Icons.credit_card,
    CupertinoIcons.creditcard_fill,
    Icons.person_pin_sharp,
    Icons.perm_identity,
    CupertinoIcons.rectangle_fill_on_rectangle_angled_fill
  ];
  List pages = [
    creditcard(),
    debitcard(),
    identificationcards(),
    organizationcards(),
    othercards(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        final _state = widget.sideMenuKey.currentState;
                        if (_state.isOpened)
                          _state.closeSideMenu();
                        else
                          _state.openSideMenu();
                      }),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 10),
              child: Text(
                "What's up,",
                style: GoogleFonts.ibmPlexSans(
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 25, top: 20, bottom: 25),
                child: Text("CATEGORIES",
                    style: GoogleFonts.roboto(color: Colors.white54))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => pages[0],
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Color(0xff041955),
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Icon(
                              icons[0],
                              size: 60,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Text(
                              '${l[0]}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => pages[1],
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Color(0xff041955),
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Icon(
                              icons[1],
                              size: 60,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Text(
                              '${l[1]}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => pages[2],
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Color(0xff041955),
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Icon(
                              icons[2],
                              size: 60,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Text(
                              '${l[2]}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => pages[3],
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Color(0xff041955),
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Icon(
                              icons[3],
                              size: 60,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Text(
                              '${l[3]}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pages[4],
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Icon(
                          icons[4],
                          size: 60,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        Text(
                          '${l[4]}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
