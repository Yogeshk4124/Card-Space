import 'package:cardspace/model/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_ui/liquid_ui.dart';

import 'SplashScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(CardCompanyAdapter());
  // Hive.registerAdapter(CardNetworkTypeAdapter());
  // Hive.registerAdapter(ValidityAdapter());
  // Hive.registerAdapter(cCardAdapter());
  Hive.registerAdapter(cardAdapter());
  // flutter packages pub run build_runner build
  // await Hive.openBox<cCard>('cards');
  await Hive.openBox<card>('DebitCards');
  await Hive.openBox<card>('CreditCards');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LiquidApp(
      materialApp: MaterialApp(
        title: 'Liquid Shrink SideMenu',
        theme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}
