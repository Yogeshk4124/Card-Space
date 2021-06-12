import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'SplashScreen.dart';
void main() {
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

