import 'dart:io';
import 'dart:typed_data';

import 'package:cardspace/CardClasses/mCard.dart';
import 'package:cardspace/Cards/cCard.dart';
import 'package:cardspace/Sliders/CreditCardSlider.dart';
import 'package:cardspace/model/Boxes.dart';
import 'package:cardspace/model/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Cards/cCard.dart';

class creditcard extends StatefulWidget {
  @override
  _creditcardState createState() => _creditcardState();
}

class _creditcardState extends State<creditcard> {
  CardNetworkType getNetworkType(String val) {
    switch (val) {
      case 'American Express':
        return CardNetworkType.amex;
        break;
      case 'Discover':
        return CardNetworkType.discover;
        break;
      case 'Mastercard':
        return CardNetworkType.mastercard;
        break;
      case 'Visa':
        return CardNetworkType.visa;
        break;
      case 'Visa Basic':
        return CardNetworkType.visaBasic;
        break;
      case 'Rupay':
        return CardNetworkType.rupay;
        break;
      case 'Other Brand':
        return CardNetworkType.other;
        break;
    }
  }

  CardCompany getCardCompany(String val) {
    print("card Company:" + val);
    switch (val) {
      case "American Express":
        return CardCompany.americanExpress;
        break;
      case 'Virgin':
        return CardCompany.virgin;
        break;
      case 'SbiCard':
        return CardCompany.sbiCard;
        break;
      case 'SBI':
        return CardCompany.sbi;
        break;
      case 'Kotak':
        return CardCompany.kotak;
        break;
      case 'Axis Bank':
        return CardCompany.axisBank;
        break;
      case 'Axis Bank White':
        return CardCompany.axisBankWhite;
        break;
      case 'CitiBank':
        return CardCompany.citiBank;
        break;
      case 'HDFC':
        return CardCompany.hdfc;
        break;
      case 'HSBC':
        return CardCompany.hsbc;
        break;
      case 'icici':
        return CardCompany.icici;
        break;
      case 'indusland':
        return CardCompany.indusland;
        break;
      case 'YesBank':
        return CardCompany.yesBank;
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
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Text(
                  "Credit Cards",
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
                valueListenable: Boxes.getCreditCards().listenable(),
                builder: (context, box, _) {
                  final cards = box.values.toList().cast<card>();
                  if (cards.length > 0) {
                    print("CardLength:" + cards.length.toString());
                    return buildContent(cards);
                  }
                  // return Container(child: Text(cards[1].cardNumber+"Hello"),color: Colors.pink,width: 200,height: 10,);
                  else
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
                            'No Credit Card Found',
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
