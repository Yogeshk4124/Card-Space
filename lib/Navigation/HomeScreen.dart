import 'package:cardspace/Forms/creditCardForm.dart';
import 'package:cardspace/Forms/debitCardForm.dart';
import 'package:cardspace/Forms/identificationCardsForm.dart';
import 'package:cardspace/Forms/organizationCardForm.dart';
import 'package:cardspace/Forms/otherCardForm.dart';
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
    creditCardForm(),
    debitCardForm(),
    identificationCardsForm(),
    organizationCardForm(),
    otherCardForm(),
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
                "What's up, Yogesh",
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
            Expanded(
              child: Center(
                  child: ListView.builder(
                itemCount: l.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => pages[index],
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      height: MediaQuery.of(context).size.height * 0.10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // color: Color(0xff041955),
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Icon(icons[index]),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                          Text(
                            '${l[index]}',
                            style: GoogleFonts.oswald(
                                fontSize: 16, letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
