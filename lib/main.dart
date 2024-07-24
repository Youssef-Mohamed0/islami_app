import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_11/providers/my_provider.dart';
import 'package:islami_11/sura_details.dart';
import 'package:islami_11/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/hadeth_Details.dart';
import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MyProvider(),
      ),
    ],
    builder: (context, child) {
      var provider = Provider.of<MyProvider>(context);

      return EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          saveLocale: true,
          startLocale: Locale(provider.languageCode),
          child: MyApp());
    },
  ));
}

class MyApp extends StatelessWidget {
  late MyProvider provider;


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProvider>(context);
    getTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(provider.languageCode),
      debugShowCheckedModeBanner: false,
      themeMode: provider.themeMode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
    );
  }
  Future<void>getTheme ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isdark');
    if(isDark != null){
      if(isDark == true){
        provider.themeMode =ThemeMode.dark;
      }else{
        provider.themeMode =ThemeMode.light;
      }
      provider.notifyListeners();
    }

  }
}
