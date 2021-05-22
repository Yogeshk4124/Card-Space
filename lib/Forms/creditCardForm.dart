import 'package:cardspace/cCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dropdown_search/dropdown_search.dart';
import '../mCard.dart';

class creditCardForm extends StatefulWidget {
  @override
  _creditCardFormState createState() => _creditCardFormState();
}

class _creditCardFormState extends State<creditCardForm> {
  String validth = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Add Credit Card',
                  style: GoogleFonts.roboto(fontSize: 22),
                )
              ],
            ),
            Center(
              child: cCard(
                cardBackground:
                    SolidColorCardBackground(Colors.red.withOpacity(0.6)),
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
            ),
            TextField(
              maxLines: 1,
              minLines: 1,
              style: GoogleFonts.abel(),
              maxLength: 19,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white)),
                hintText: '1234-1234-1234-1234',
                labelText: 'Card Number',
                prefixIcon: const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
                prefixText: ' ',
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: [
                        "American Express",
                        "Discover",
                        "Mastercard",
                        'Visa',
                        'Other Brand'
                      ],
                      label: "Card Type",
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: print,
                      selectedItem: "Visa"),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    // maxLines: 1,
                    // minLines: 1,
                    style: GoogleFonts.abel(),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: '****',
                      labelText: 'CVV',
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Valid from',
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      print('clicked');
                      showDatePicker(
                              currentDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2000),
                              lastDate: DateTime.utc(2050),
                              context: context,
                              initialDatePickerMode: DatePickerMode.year)
                          .then((value) {
                        setState(() {
                          validth = value.month.toString() +
                              "/" +
                              value.year.toString();
                        });
                      });
                    },
                    readOnly: true,
                    // enabled: false,
                    controller: TextEditingController(text: validth),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Valid To',
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      print('clicked');
                      showDatePicker(
                              currentDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2000),
                              lastDate: DateTime.utc(2050),
                              context: context,
                              initialDatePickerMode: DatePickerMode.year)
                          .then((value) {
                        setState(() {
                          validth = value.month.toString() +
                              "/" +
                              value.year.toString();
                        });
                      });
                    },
                    readOnly: true,
                    // enabled: false,
                    controller: TextEditingController(text: validth),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                labelText: 'Card Holder Name',
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: TextEditingController(),
            ),
            DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItem: true,
                // CardCompany.axisBank
                items: [
                  "American Express",
                  "Axis Bank",
                  "Mastercard",
                  'Visa',
                  'Other Brand'
                ],
                label: "Card Type",
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: print,
                selectedItem: "Visa"),
          ],
        ),
      ),
    );
  }
}
