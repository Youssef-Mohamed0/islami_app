import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;

  Future<void>getTheme ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isdark');
    if(isDark != null){
      if(isDark == true){
          themeMode =ThemeMode.dark;
      }else{
        themeMode =ThemeMode.light;
      }
      notifyListeners();
    }

  }

  changeLanguage(BuildContext context,String code) {
    context.setLocale (Locale(code));
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode mode) async {
    themeMode = mode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isdark', mode == ThemeMode.dark);
    notifyListeners();
  }

  String getBackgroundImagePath() {
    if (themeMode == ThemeMode.light) {
      return "assets/images/background.png";
    } else {
      return "assets/images/bg_dark.png";
    }
  }
}
