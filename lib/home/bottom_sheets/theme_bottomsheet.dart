import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../../providers/my_provider.dart';
import '../../theme_data.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "light".tr(),
                  style: GoogleFonts.elMessiri(
                      fontSize: 25,
                      color: provider.themeMode == ThemeMode.light
                          ? Color(0xFFB7935F)
                          : Colors.black),
                ),
                provider.themeMode == ThemeMode.light
                    ? Icon(
                  Icons.done,
                  size: 30,
                  color: Color(0xFFB7935F),
                )
                    : SizedBox()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'dark'.tr(),
                  style: GoogleFonts.elMessiri(
                      fontSize: 25,
                      color: provider.themeMode == ThemeMode.dark
                          ? Color(0xFFB7935F)
                          : Colors.black),
                ),
                provider.themeMode == ThemeMode.light
                    ? SizedBox()
                    : Icon(
                  Icons.done,
                  size: 30,
                  color: Color(0xFFB7935F),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
