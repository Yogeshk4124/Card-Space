import 'package:cardspace/SliderPages/HomeScreen.dart';
import 'package:cardspace/SliderPages/creditcard.dart';
import 'package:cardspace/SliderPages/debitcard.dart';
import 'package:flutter/cupertino.dart';

Widget page(int x, dynamic sideMenuKey) {
  switch (x) {
    case 1:
      return HomeScreen(sideMenuKey: sideMenuKey);
      break;
    case 2:
      return creditcard(sideMenuKey: sideMenuKey);
      break;
    case 3:
      return debitcard(sideMenuKey: sideMenuKey);
      break;
    case 4:
      return debitcard(sideMenuKey: sideMenuKey);
      break;
    // case 4:return idcard(sideMenuKey: sideMenuKey);
    //   break;
    // case 5:return organizationcards(sideMenuKey: sideMenuKey);
    // break;
    // case 6:return othercard(sideMenuKey: sideMenuKey);
    // break;
    default:
      return HomeScreen(sideMenuKey: sideMenuKey);
  }
}