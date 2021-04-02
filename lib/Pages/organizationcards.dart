import 'package:credit_card_slider/card_background.dart';
import 'package:credit_card_slider/card_company.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/credit_card_slider.dart';
import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/validity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class organizationcards extends StatefulWidget {
  dynamic sideMenuKey;

  organizationcards({@required this.sideMenuKey});

  @override
  _organizationcardsState createState() => _organizationcardsState();
}

class _organizationcardsState extends State<organizationcards> {
  var _orgcards = [
    CreditCard(
      cardBackground: SolidColorCardBackground(Colors.red),
      cardNetworkType: CardNetworkType.visaBasic,
      cardHolderName: 'The boring developer',
    ),
    CreditCard(
      cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
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
    ),
    CreditCard(
      cardBackground: SolidColorCardBackground(Colors.red.withOpacity(0.4)),
      cardNetworkType: CardNetworkType.mastercard,
      cardHolderName: 'Gursheesh Singh',
      cardNumber: '2434 2434 **** ****',
      company: CardCompany.kotak,
      validity: Validity(
        validThruMonth: 1,
        validThruYear: 21,
      ),
    ),
    CreditCard(
      cardBackground: GradientCardBackground(LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.blue, Colors.purple],
        stops: [0.3, 0.95],
      )),
      cardNetworkType: CardNetworkType.mastercard,
      cardHolderName: 'Very Very very boring devloper',
      cardNumber: '4567',
      company: CardCompany.sbiCard,
      validity: Validity(
        validThruMonth: 2,
        validThruYear: 2021,
      ),
    ),
    CreditCard(
      cardBackground:
      ImageCardBackground(AssetImage('images/background_sample.jpg')),
      cardNetworkType: CardNetworkType.mastercard,
      cardHolderName: 'John Doe',
      cardNumber: '2434 2434 **** ****',
      company: CardCompany.virgin,
      validity: Validity(
        validThruMonth: 1,
        validThruYear: 20,
      ),
    ),
    CreditCard(
      cardNetworkType: CardNetworkType.rupay,
      cardHolderName: 'THE BORING DEVELOPER',
      cardNumber: '2434 2434 **** ****',
      company: CardCompany.sbi, cardBackground: SolidColorCardBackground(Colors.deepOrangeAccent),
    ),
  ];

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
                Text("Credit Cards",style: TextStyle(fontSize: 16),)
              ],
            ),
            Expanded(
              child: CreditCardSlider(
                _orgcards,repeatCards: RepeatCards.bothDirection,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
