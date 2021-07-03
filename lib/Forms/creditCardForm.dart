import 'dart:io';
import 'dart:typed_data';

import 'package:cardspace/Cards/cCard.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:toast/toast.dart';

import '../CardClasses/mCard.dart';
import '../model/Boxes.dart';
import '../model/card.dart';

class creditCardForm extends StatefulWidget {
  dynamic sideMenuKey;

  creditCardForm({@required this.sideMenuKey});

  @override
  _creditCardFormState createState() => _creditCardFormState();
}

class _creditCardFormState extends State<creditCardForm> {
  String validth = "", validFrom = "";
  int colorType = 0;
  int _isVisible = 0;
  CardBackground cardBg =
      GradientCardBackground(LinearGradient(colors: [Colors.red, Colors.pink]));
  String path = "";
  TextEditingController cNo = new TextEditingController();
  TextEditingController hName = new TextEditingController();
  TextEditingController cvv = new TextEditingController();
  CardCompany comName;
  CardNetworkType cType;
  List<String> selected = [];
  File _image;
  final picker = ImagePicker();
  int validFromYear = DateTime.now().year,
      validFromMonth = DateTime.now().month,
      validToYear = DateTime.now().year + 15,
      validToMonth = DateTime.now().month;
  String db_companyCard;
  String db_CardType;
  String db_SolidColor = "Red";
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        print("path to file:" + pickedFile.path);
        path = pickedFile.path;
        _image = File(pickedFile.path);
        // Image.file(_image);
        Uint8List bytes = _image.readAsBytesSync();
        cardBg = new ImageCardBackground(MemoryImage(bytes));
      } else {
        print('No image selected.');
      }
    });
  }

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
    var DemoCard = cCard(
      cardBackground: cardBg,
      cardNetworkType: cType,
      cardHolderName: hName.text,
      cardNumber: cNo.text,
      company: comName,
      validity: Validity(
        validThruMonth: validToMonth,
        validThruYear: validToYear,
        validFromMonth: validFromMonth,
        validFromYear: validFromYear,
      ),
      showBackView: false,
      cvvCode: cvv.text,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'Add Credit Card',
                      style: GoogleFonts.roboto(fontSize: 22),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: DemoCard,
                ),
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 10,
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
                  selectedItem: 'Select Card Company',
                  onChanged: (val) {
                    setState(() {
                      // comName = CardCompany(widget: getCardCompany(val));
                      db_companyCard = val;

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
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownSearch<String>(
                        mode: Mode.DIALOG,
                        showSelectedItem: true,
                        showSearchBox: true,
                        selectedItem: 'Select Card Type',
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
                        onChanged: (val) {
                          // cType =
                          // CardNetworkType(widget: getNetworkType('amex'));
                          db_CardType = val;
                          setState(() {
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
                          });
                        },
                      ),
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
                SizedBox(
                  height: 10,
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
                          showDatePicker(
                                  currentDate: DateTime.now(),
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.utc(2000),
                                  lastDate: DateTime.utc(2050),
                                  context: context,
                                  initialDatePickerMode: DatePickerMode.year)
                              .then((value) {
                            setState(() {
                              validFromMonth = value.month;
                              validFromYear = value.year;
                              validFrom = value.month.toString() +
                                  "/" +
                                  value.year.toString();
                            });
                          });
                        },
                        readOnly: true,
                        // enabled: false,
                        controller: TextEditingController(text: validFrom),
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
                          showDatePicker(
                                  currentDate: DateTime.now(),
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.utc(2000),
                                  lastDate: DateTime.utc(2050),
                                  context: context,
                                  initialDatePickerMode: DatePickerMode.year)
                              .then((value) {
                            setState(() {
                              validToMonth = value.month;
                              validToYear = value.year;
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
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 10,
                ),
                DropdownSearch<String>(
                  mode: Mode.DIALOG,
                  showSelectedItem: true,
                  showSearchBox: true,
                  items: ['Solid', 'Linear', 'Image'],
                  label: "Card Background",
                  onChanged: (val) {
                    setState(
                      () {
                        switch (val) {
                          case 'Solid':
                            colorType = 1;
                            _isVisible = 1;
                            setState(() {});
                            break;
                          case 'Linear':
                            colorType = 2;
                            _isVisible = 2;
                            setState(() {});
                            break;
                          case 'Image':
                            colorType = 3;
                            _isVisible = 3;
                            setState(() {});
                            break;
                        }
                      },
                    );
                  },
                  selectedItem: 'Select Background Type',
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: _isVisible == 1,
                  child: DropdownSearch<String>(
                      mode: Mode.DIALOG,
                      showSelectedItem: true,
                      showSearchBox: true,
                      items: [
                        'Red',
                        'White',
                        'Pink',
                        'Yellow',
                      ],
                      label: "Color",
                      onChanged: (val) {
                        db_SolidColor = val;
                        switch (val) {
                          case 'Red':
                            cardBg = new SolidColorCardBackground(Colors.red);
                            // setState(() {});
                            break;
                          case 'White':
                            cardBg = new SolidColorCardBackground(Colors.white);
                            // setState(() {});
                            break;
                          case 'Pink':
                            cardBg = new SolidColorCardBackground(Colors.pink);
                            // setState(() {});
                            break;
                          case 'Yellow':
                            cardBg =
                                new SolidColorCardBackground(Colors.yellow);
                            // setState(() {});
                            break;
                        }
                      },
                      selectedItem: 'Red'),
                ),
                Visibility(
                  visible: _isVisible == 2,
                  child: DropDownMultiSelect(
                    onChanged: (List<String> x) {
                      selected = x;
                      List<Color> colors = [];
                      for (var i in selected) {
                        colors.add(getColor(i));
                      }
                      cardBg = new GradientCardBackground(
                          LinearGradient(colors: colors));
                    },
                    options: ['Red', 'Pink', 'White', 'Yellow'],
                    selectedValues: selected,
                    whenEmpty: 'Select Something',
                  ),
                ),
                Visibility(
                    visible: _isVisible == 3,
                    child: GestureDetector(
                      onTap: getImage,
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Text('Upload Image'),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text('View Color Changes'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    final cards = Boxes.getCreditCards();
                    if (db_companyCard == "" ||
                        cvv.text.length < 3 ||
                        cNo.text.length < 19 ||
                        db_CardType == "" ||
                        hName.text == "" ||
                        _isVisible < 1 ||
                        _isVisible > 3 ||
                        validToYear < DateTime.now().year ||
                        validToMonth < 0 ||
                        validToMonth > 12 ||
                        validFromMonth > 12 ||
                        validFromMonth < 0 ||
                        validFromYear < 0 ||
                        validFromYear > DateTime.now().year) {
                      Toast.show("Please provide all details or valid details",
                          context,
                          duration: 2, gravity: 0);
                    } else {
                      var d = card(
                        company: db_companyCard,
                        cvvCode: cvv.text,
                        cardNumber: cNo.text,
                        cardNetworkType: db_CardType,
                        cardHolderName: hName.text,
                        bgType: _isVisible,
                        gradient: selected,
                        path: path,
                        solid: db_SolidColor,
                        validityFromMonth: validFromMonth,
                        validityFromYear: validFromYear,
                        validityToMonth: validToMonth,
                        validityToYear: validToYear,
                      );
                      try {
                        cards.add(d);
                        print("card submitted");
                        Navigator.of(context).pop();
                      } catch (Exception) {
                        print('error');
                      }
                    }
                  },
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
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(String color) {
    switch (color) {
      case 'Red':
        return Colors.red;
        break;
      case 'Yellow':
        return Colors.yellow;
        break;
      case 'Pink':
        return Colors.pink;
        break;
      case 'White':
        return Colors.white;
        break;
      default:
        return Colors.red;
    }
  }
}
