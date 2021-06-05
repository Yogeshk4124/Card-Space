import 'package:cardspace/CardClasses/mCard.dart';
import 'package:cardspace/Cards/cCard.dart';
import 'package:cardspace/Sliders/CreditCardSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class organizationcards extends StatefulWidget {
  dynamic sideMenuKey;

  organizationcards({@required this.sideMenuKey});

  @override
  _organizationcardsState createState() => _organizationcardsState();
}

class _organizationcardsState extends State<organizationcards> {
  List<cCard> debitCards ;
  @override
  void initState() {
    super.initState();
    debitCards=[
      cCard(
        cardBackground: SolidColorCardBackground(Colors.red.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 1234 1234 1234',
        company: CardCompany.yesBank,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
        showBackView: false,
        cvvCode: '1232',
      ),
      cCard(
        cardBackground: SolidColorCardBackground(Colors.red.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 1234 1234 1234',
        company: CardCompany.yesBank,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
        showBackView: false,
        cvvCode: '1232',
      ),
    ];
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
                Text("Debit Cards",style: TextStyle(fontSize: 16),)
              ],
            ),
            Expanded(
              child: CreditCardSlider(
                debitCards,repeatCards: RepeatCards.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
