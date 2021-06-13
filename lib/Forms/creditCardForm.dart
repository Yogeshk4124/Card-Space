import 'package:cardspace/Cards/cCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../CardClasses/mCard.dart';

class creditCardForm extends StatefulWidget {
  @override
  _creditCardFormState createState() => _creditCardFormState();
}

class _creditCardFormState extends State<creditCardForm> {
  String validth = "";
  int colorType = 0;
  var cardBg;
  TextEditingController cNo = new TextEditingController();
  TextEditingController hName = new TextEditingController();
  TextEditingController cvv = new TextEditingController();
  CardCompany comName = CardCompany.sbi;
  CardNetworkType cType = CardNetworkType.visaBasic;

  @override
  Widget build(BuildContext context) {
    cNo.addListener(() {
      setState(() {});
    });
    cvv.addListener(() {
      setState(() {});
    });
    hName.addListener(() {
      setState(() {});
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      'Add Credit Card',
                      style: GoogleFonts.roboto(fontSize: 22),
                    )
                  ],
                ),
                Center(
                  child: cCard(
                    // cardBackground:
                    //     SolidColorCardBackground(Colors.white.withOpacity(0.6)),
                    cardBackground: cardBg,
                    cardNetworkType: cType,
                    cardHolderName: hName.text,
                    cardNumber: cNo.text,
                    company: comName,
                    validity: Validity(
                      validThruMonth: 1,
                      validThruYear: 21,
                      validFromMonth: 1,
                      validFromYear: 16,
                    ),
                    showBackView: false,
                    cvvCode: cvv.text,
                  ),
                ),
                TextField(
                  maxLines: 1,
                  minLines: 1,
                  style: GoogleFonts.abel(),
                  controller: cNo,
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
                DropdownSearch<String>(
                    mode: Mode.DIALOG,
                    showSelectedItem: true,
                    showSearchBox: true,
                    items: [
                      'American Express',
                      'Axis Bank',
                      'Axis Bank White',
                      'icici',
                      'CitiBank',
                      'HDFC',
                      'HSBC',
                      'indusland',
                      'Kotak',
                      'SBI',
                      'Virgin',
                      'SbiCard',
                      'YesBank'
                    ],
                    label: "Company Name",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (val) {
                      setState(() {
                        switch (val) {
                          case "American Express":
                            comName = CardCompany.americanExpress;
                            break;
                          case "Axis Bank":
                            comName = CardCompany.axisBank;
                            break;
                          case "Axis Bank White":
                            comName = CardCompany.axisBankWhite;
                            break;
                          case 'CitiBank':
                            comName = CardCompany.citiBank;
                            break;
                          case 'HDFC':
                            comName = CardCompany.hdfc;
                            break;
                          case "HSBC":
                            comName = CardCompany.hsbc;
                            break;
                          case 'icici':
                            comName = CardCompany.icici;
                            break;
                          case 'indusland':
                            print('here');
                            comName = CardCompany.indusland;
                            break;
                          case 'Kotak':
                            comName = CardCompany.kotak;
                            break;
                          case 'SBI':
                            comName = CardCompany.sbi;
                            break;
                          case 'Virgin':
                            comName = CardCompany.virgin;
                            break;
                          case 'SbiCard':
                            comName = CardCompany.sbiCard;
                            break;
                          case 'YesBank':
                            comName = CardCompany.yesBank;
                            break;
                        }
                      });
                    },
                    selectedItem: 'SbiCard'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownSearch<String>(
                          mode: Mode.DIALOG,
                          showSelectedItem: true,
                          showSearchBox: true,
                          items: [
                            'American Express',
                            'Discover',
                            'Mastercard',
                            'Visa',
                            'Visa Basic',
                            'Rupay',
                            'Other Brand'
                          ],
                          label: "Card Type",
                          popupItemDisabled: (String s) => s.startsWith('I'),
                          onChanged: (val) {
                            setState(
                              () {
                                switch (val) {
                                  case 'American Express':
                                    cType = CardNetworkType.amex;
                                    break;
                                  case 'Discover':
                                    cType = CardNetworkType.discover;
                                    break;
                                  case 'Mastercard':
                                    cType = CardNetworkType.mastercard;
                                    break;
                                  case 'Visa':
                                    cType = CardNetworkType.visa;
                                    break;
                                  case 'Visa Basic':
                                    cType = CardNetworkType.visaBasic;
                                    break;
                                  case 'Rupay':
                                    cType = CardNetworkType.rupay;
                                    break;
                                  case 'Other Brand':
                                    cType = CardNetworkType.other;
                                    break;
                                }
                              },
                            );
                          },
                          selectedItem: 'Visa'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: cvv,
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
                  controller: hName,
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
                ),
                DropdownSearch<String>(
                    mode: Mode.DIALOG,
                    showSelectedItem: true,
                    showSearchBox: true,
                    items: ['Solid', 'Linear', 'Image'],
                    label: "Card Type",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (val) {
                      setState(
                        () {
                          switch (val) {
                            case 'Solid':
                              colorType = 1;
                              setState(() {});
                              break;
                            case 'Linear':
                              colorType = 2;
                              setState(() {});
                              break;
                            case 'Image':
                              colorType = 3;
                              setState(() {});
                              break;
                          }
                        },
                      );
                    },
                    selectedItem: 'Solid'),
                if (colorType == 1)
                  DropdownSearch<String>(
                    
                      mode: Mode.DIALOG,
                      showSelectedItem: true,
                      showSearchBox: true,
                      items: [
                        'Red',
                        'White',
                        'Pink',
                        'Yellow',
                      ],
                      label: "Card Type",
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: (val) {
                        setState(
                          () {
                            switch (val) {
                              case 'Red':
                                cardBg = new SolidColorCardBackground(Colors.red);
                                setState(() {});
                                break;
                              case 'White':
                                cardBg = new SolidColorCardBackground(Colors.white);
                                setState(() {});
                                break;
                              case 'Pink':
                                cardBg = new SolidColorCardBackground(Colors.pink);
                                setState(() {});
                                break;
                              case 'Yellow':
                                cardBg = new SolidColorCardBackground(Colors.yellow);
                                setState(() {});
                                break;
                            }
                          },
                        );
                      },
                      selectedItem: 'Red'),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text('Save Card'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
