import 'dart:io';
import 'dart:typed_data';

import 'package:cardspace/Sliders/CreditCardSlider.dart';
import 'package:cardspace/model/Boxes.dart';
import 'package:cardspace/model/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../CardClasses/mCard.dart';
import '../Cards/cCard.dart';

class debitcard extends StatefulWidget {
  dynamic sideMenuKey;

  debitcard({@required this.sideMenuKey});

  @override
  _debitcardState createState() => _debitcardState();
}

class _debitcardState extends State<debitcard> with TickerProviderStateMixin {
  Widget getNetworkType(String val) {
    switch (val) {
      case 'American Express':
        return Image.asset(
          'assets/flutter/amex.png',
          height: 48,
          width: 48,
        );
        break;
      case 'Discover':
        return Image.asset(
          'assets/flutter/discover.png',
          height: 48,
          width: 48,
        );
        break;
      case 'Mastercard':
        return Image.asset(
          'assets/cardslider/mastercard.png',
          height: 40,
        );
        break;
      case 'Visa':
        return Image.asset(
          'assets/cardslider/visa.jpeg',
          height: 35,
        );
        break;
      case 'Visa Basic':
        return Image.asset(
          'assets/cardslider/visa_basic.png',
          height: 20,
        );
        break;
      case 'Rupay':
        return Image.asset(
          'assets/cardslider/rupay_logo.png',
          height: 40,
        );
        break;
      case 'Other Brand':
        return Container(height: 40, width: 40, child: Text('XYZ'));
        break;
    }
  }

  Widget getCardCompany(String val) {
    print("card Company:" + val);
    switch (val) {
      case "American Express":
        return Text(
          'AMERICAN \nEXPRESS',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        );
        break;
      case 'Virgin':
        return Image.asset(
          'assets/cardslider/virgin.png',
          height: 40,
        );
        break;
      case 'SbiCard':
        return Image.asset(
          'assets/cardslider/sbi_card.gif',
          height: 35,
        );
        break;
      case 'SBI':
        return Image.asset(
          'assets/cardslider/sbi.png',
          height: 35,
        );
        break;
      case 'Kotak':
        return Image.asset(
          'assets/cardslider/kotak_logo.png',
          height: 35,
        );
        break;
      case 'Axis Bank':
        return Image.asset(
          'assets/cardslider/axis_bank_logo.png',
          height: 35,
        );
        break;
      case 'Axis Bank White':
        return Image.asset(
          'assets/cardslider/axis_bank_logo.png',
          height: 35,
          color: Colors.white,
        );
        break;
      case 'CitiBank':
        return Image.asset(
          'assets/cardslider/citibank_logo.png',
          height: 25,
        );
        break;
      case 'HDFC':
        return Image.asset(
          'assets/cardslider/hdfc_logo.png',
          height: 25,
        );
        break;
      case 'HSBC':
        return Image.asset(
          'assets/cardslider/hsbc_logo.png',
          height: 30,
        );
        break;
      case 'icici':
        return Image.asset(
          'assets/cardslider/icici_bank_logo.png',
          height: 25,
        );
        break;
      case 'indusland':
        return Image.asset(
          'assets/cardslider/indusland.png',
          height: 15,
        );
        break;
      case 'YesBank':
        return Image.asset(
          'assets/cardslider/yes_bank_logo.png',
          height: 35,
        );
        break;
    }
  }

  MemoryImage getImage(String path) {
    var _image = File(path);
    // Image.file(_image);
    Uint8List bytes = _image.readAsBytesSync();
    return MemoryImage(bytes);
  }

  getColor(String color) {
    switch (color) {
      case 'Red':
        return Colors.red;
        // setState(() {});
        break;
      case 'White':
        return Colors.white;
        break;
      case 'Pink':
        return Colors.pink;
        break;
      case 'Yellow':
        return Colors.yellow;
        break;
    }
  }

  getGradient(List<String> gradient) {
    List<Color> color = [];
    for (var i in gradient) {
      color.add(getColor(i));
    }
    return LinearGradient(colors: color);
  }

  Widget buildContent(List<card> cards) {
    List<cCard> ls = [];
    // int skip = 1;
    for (var i in cards) {
      // if (skip < 5) {
      //   skip++;
      //   continue;
      // }
      print('success:' + i.cardNumber);

      cCard d = cCard(
        cardBackground: i.bgType == 1
            ? SolidColorCardBackground(getColor(i.solid))
            : i.bgType == 2
                ? GradientCardBackground(getGradient(i.gradient))
                : ImageCardBackground(getImage(i.path)),
        cardNetworkType:
            // CardNetworkType(widget: getNetworkType(i.cardNetworkType)),
            CardNetworkType.visaBasic,
        cardHolderName: i.cardHolderName,
        cardNumber: i.cardNumber,
        // company: CardCompany(widget: getCardCompany(i.company.toString())),
        company: CardCompany.indusland,
        validity: Validity(
          validThruMonth: i.validityToMonth,
          validThruYear: i.validityToYear,
          validFromMonth: i.validityFromMonth,
          validFromYear: i.validityFromYear,
        ),
        showBackView: false,
        cvvCode: i.cvvCode,
      );
      ls.add(d);
    }
    return CreditCardSlider(
      ls,
      repeatCards: RepeatCards.none,
    );
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
                Text(
                  "Debit Cards",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            // Expanded(
            //   child: CreditCardSlider(
            //     _creditCards,
            //     repeatCards: RepeatCards.bothDirection,
            //   ),
            // ),
            Expanded(
              child: ValueListenableBuilder<Box<card>>(
                valueListenable: Boxes.getDebitCards().listenable(),
                builder: (context, box, _) {
                  final cards = box.values.toList().cast<card>();
                  if (cards.length > 0) {
                    print("CardLength:" + cards.length.toString());
                    return buildContent(cards);
                  } else
                    return Container(
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
                            'No debit Card Found',
                            style: GoogleFonts.courierPrime(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
