// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `2048`
  String get titleName {
    return Intl.message(
      '2048',
      name: 'titleName',
      desc: '',
      args: [],
    );
  }

  /// `Play 2048 Game flutter`
  String get titleWelcome {
    return Intl.message(
      'Play 2048 Game flutter',
      name: 'titleWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Join and get to the 2048 tile!`
  String get titleWelDesc {
    return Intl.message(
      'Join and get to the 2048 tile!',
      name: 'titleWelDesc',
      desc: '',
      args: [],
    );
  }

  /// `BEST`
  String get labelBest {
    return Intl.message(
      'BEST',
      name: 'labelBest',
      desc: '',
      args: [],
    );
  }

  /// `SCORE`
  String get labelScore {
    return Intl.message(
      'SCORE',
      name: 'labelScore',
      desc: '',
      args: [],
    );
  }

  /// `New Game`
  String get btnNewGame {
    return Intl.message(
      'New Game',
      name: 'btnNewGame',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}