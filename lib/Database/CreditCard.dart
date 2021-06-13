import 'package:flutter/cupertino.dart';

class CreditCard {
  int id;
  String cardBackground;
  String cardNetworkType;
  String cardHolderName;
  String cardNumber;
  String company;
  int validThruMonth,
  validThruYear,
  validFromMonth,
  validFromYear;
  int cvvCode;
  CreditCard({
    @required this.id,
    @required this.cardBackground,
    @required this.cardNetworkType,
    @required this.cardHolderName,
    @required this.cardNumber,
    @required this.company,
    @required this.validThruMonth,
    @required this.validThruYear,
    @required this.validFromMonth,
    @required this.validFromYear,
    @required this.cvvCode,
  });
}