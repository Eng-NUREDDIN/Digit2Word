import 'package:flutter/material.dart';

class AppLocalization {
  Locale locale;

  AppLocalization(this.locale);

  static List<String> languages() => ['en', 'tr'];

  String get languageCode => locale.toString();

  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization) ??
      AppLocalization(const Locale('en'));
  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  String translate(String key, {String nullCase = ""}) {
    return (translateMap[key] ?? {})[languageCode] ?? nullCase;
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalizations = AppLocalization(locale);
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      old != this;
}

Map<String, Map<String, String>> translateMap = {
  "homePage": {
    'en': "Home Page",
    'tr': "Ana Sayfa",
  },
  "enterNumber": {
    'en': "Enter A Number",
    'tr': "Numara Giriniz",
  },
  "convert": {
    'en': "Convert",
    'tr': "Çevir",
  },
  "result": {
    'en': "Output",
    'tr': "Sonuç",
  },
  "introduction": {
    'en':
        'Please enter an INTEGER number in the "Input" box and tap on "convert" to see the equivalent in words appear in the "Output" box.',
    'tr':
        'Lütfen "Giriş" kutusuna bir TAMSAYI girin ve "Çevir" e dokunun, eşdeğerinin kelimelerde görünmesi için "Çıktı" kutusunda görünür.',
  },
  "input": {
    'en': "Input",
    'tr': "Giriş",
  },
  "output": {
    'en': "Output",
    'tr': "Çıktı",
  },
};
