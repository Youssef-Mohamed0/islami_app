import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png'),
            Padding(
              padding: const EdgeInsets.only(top: 270.0),
              child: Text("اذاعه القران الكريم",style: TextStyle(
      color: Colors.black),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 550.0),
              child: Image.asset('assets/images/Group 5.png'),
            ),
          ],
        ),

      ],
    );
  }
}