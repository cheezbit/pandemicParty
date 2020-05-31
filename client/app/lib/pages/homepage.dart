import 'package:app/pages/mainfeed.dart';
import 'package:app/pages/settingspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomePage extends StatelessWidget {
  CupertinoTabController tabController = CupertinoTabController();
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
            backgroundColor: CupertinoColors.extraLightBackgroundGray,

      controller: this.tabController,
      tabBuilder: (c, i) {
        switch (i) {
          case 0:
            return MainFeed();
          case 2:
            return SettingsPage(tabController: this.tabController);
          default:
            return Container();
        }
      },
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Mdi.home,
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
