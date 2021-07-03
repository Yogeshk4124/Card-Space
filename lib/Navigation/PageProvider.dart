import 'package:cardspace/Forms/creditCardForm.dart';
import 'package:cardspace/Forms/debitCardForm.dart';
import 'package:cardspace/Forms/identificationCardsForm.dart';
import 'package:cardspace/Forms/organizationCardForm.dart';
import 'package:cardspace/Forms/otherCardForm.dart';
import 'package:cardspace/Navigation/HomeScreen.dart';
import 'package:flutter/cupertino.dart';

Widget page(int x, dynamic sideMenuKey) {
  switch (x) {
    case 1:
      return HomeScreen(sideMenuKey: sideMenuKey);
      break;
    case 2:
      return creditCardForm(sideMenuKey: sideMenuKey);
      break;
    case 3:
      return debitCardForm(sideMenuKey: sideMenuKey);
      break;
    case 4:
      return identificationCardsForm(sideMenuKey: sideMenuKey);
      break;
    case 5:
      return organizationCardForm(sideMenuKey: sideMenuKey);
      break;
    case 6:
      return otherCardForm(sideMenuKey: sideMenuKey);
      break;
    default:
      return HomeScreen(sideMenuKey: sideMenuKey);
  }
}
