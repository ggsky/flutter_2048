import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(GameApp());

class GameApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: "2048",
      theme: ThemeData(primaryColor: Colors.orange),
      home: Material(
        color: Color(0xfffaf8ef),
        child: SafeArea(
          left: false,
          right: false,
          child: IndexPage(),
        ),
      ),
    );
  }
}
