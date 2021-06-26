import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'PageProvider.dart';

class MenuScreen extends StatefulWidget {

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  int option=1;
  @override
  void dispose(){
    Hive.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      menu: buildMenu(),
      // background: Color(0xff041955),
      background: Colors.deepOrangeAccent,
      type: SideMenuType.slideNRotate,
      child: page(option,_sideMenuKey),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                LText(
                  "\l.lead{Hello},\n\l.lead.bold{Yogesh}",
                  baseStyle: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {
              setState(() {
                _sideMenuKey.currentState.closeSideMenu();
                option=1;
              });
            },
            leading: Icon(Icons.home, size: 20.0, color: Colors.white),
            title: Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {
              setState(() {
                _sideMenuKey.currentState.closeSideMenu();
                option=2;
              });
            },
            leading: Icon( Icons.credit_card_outlined, size: 20.0, color: Colors.white),
            title: Text("Credit Cards"),
            textColor: Colors.white,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {
              setState(() {
                _sideMenuKey.currentState.closeSideMenu();
                option=3;
              });
            },
            leading:
            Icon( CupertinoIcons.creditcard_fill, size: 20.0, color: Colors.white),
            title: Text("Debit Cards"),
            textColor: Colors.white,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {
              setState(() {
                _sideMenuKey.currentState.closeSideMenu();
                option=4;
              });

            },
            leading: Icon(Icons.person_pin_sharp, size: 20.0, color: Colors.white),
            title: Text("Identification Cards"),
            textColor: Colors.white,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {
              setState(() {
                _sideMenuKey.currentState.closeSideMenu();
                option=5;
              });
            },
            leading: Icon(    Icons.perm_identity, size: 20.0, color: Colors.white),
            title: Text("Organization Cards"),
            textColor: Colors.white,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {
              setState(() {
                _sideMenuKey.currentState.closeSideMenu();
                option=6;
              });
            },
            leading: Icon( CupertinoIcons.rectangle_fill_on_rectangle_angled_fill, size: 20.0, color: Colors.white),
            title: Text("Other Cards"),
            textColor: Colors.white,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
