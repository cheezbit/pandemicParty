import 'package:flutter_cognito_plugin/flutter_cognito_plugin.dart';
import 'package:app/global/AWS.dart';
import 'package:app/pages/loginpage.dart';
import 'package:app/pages/signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  final CupertinoTabController tabController;

  const SettingsPage({Key key, this.tabController}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool loggedIn;

  @override
  void initState() {
    super.initState();
    loggedIn = false;
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Settings"),
        heroTag: "Settings",
        transitionBetweenRoutes: false,
      ),
      child: SettingsList(
        sections: [
          SettingsSection(
            title: "Account",
            tiles: [
              SettingsTile(
                title: this.loggedIn ? "Logout" : "Login",
                onTap: () async {
                  if (this.loggedIn) {
                    await Cognito.signOut();
                    setState(() {
                      loggedIn = false;
                    });
                  } else {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (c) => LoginPage(),
                      ),
                    );
                    checkLogin();
                  }
                },
              ),
              if (!this.loggedIn)
                SettingsTile(
                  title: "Sign Up",
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (c) => SignUpPage(),
                      ),
                    );
                  },
                ),
              if (loggedIn)
                SettingsTile(
                  title: "Profile Picture",
                  onTap: () {},
                ),
              if (loggedIn)
                SettingsTile(
                  title: "My Events",
                  onTap: () {
                    this.widget.tabController.index = 1;
                  },
                ),
            ],
          ),
          SettingsSection(
            title: "App Information",
            tiles: [
              SettingsTile(
                title: "Version",
                trailing: Text("v0.1"),
              ),
              SettingsTile(
                title: "Build",
                trailing: Text("Debug"),
              ),
              SettingsTile(
                title: ("Licenses"),
                onTap: () {
                  showLicensePage(context: context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void checkLogin() async {
    UserState user = await Cognito.getCurrentUserState();
    print(user);
    setState(() {
      this.loggedIn = user == UserState.SIGNED_IN;
    });
  }
}
