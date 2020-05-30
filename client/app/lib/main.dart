import 'package:app/appTheme.dart';
import 'package:app/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Pandemic Party',
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate
      ],
      theme: CupertinoThemeData(
        primaryColor: AppTheme.mainColor
      ),
      home: HomePage(),
    );
  }
}
