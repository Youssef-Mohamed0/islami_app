import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_11/home/tabs/ahadeth.dart';
import 'package:islami_11/home/tabs/quran.dart';
import 'package:islami_11/home/tabs/radio.dart';
import 'package:islami_11/home/tabs/sebha.dart';
import 'package:islami_11/home/tabs/settings.dart';
import 'package:islami_11/providers/my_provider.dart';

import 'package:islami_11/theme_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.themeMode==ThemeMode.dark?
          "assets/images/bg.png"
              :
          "assets/images/main_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(

          appBar: AppBar(
            title: Text(
                "islami".tr(),
                style: Theme.of(context).textTheme.bodyLarge
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/moshaf_blue.png")),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: "",
                ),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
              ]),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsTab()
  ];
}
