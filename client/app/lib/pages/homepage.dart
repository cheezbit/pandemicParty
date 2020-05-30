import 'package:app/pages/mainfeed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (c,i){
        switch (i) {
          case 0:
            return MainFeed();
            break;
          default:
            return Container();
        }
      },
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Mdi.shopping,
            ),
            title: Text(
              "My Events",
            ),

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text(
              "Settings",
            ),

          )
        ],
      ),
    );
  }
}
