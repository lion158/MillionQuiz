import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/database_helper.dart';
import 'package:quizapp/data.dart';
import 'package:quizapp/helper.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/screens/category_screen.dart';

import 'package:quizapp/screens/questions_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quizapp/screens/welcome_screen.dart';

class howToPlay_screen extends StatefulWidget {
  const howToPlay_screen({Key? key}) : super(key: key);

  @override
  State<howToPlay_screen> createState() => _howToPlay_screenState();
}

class _howToPlay_screenState extends State<howToPlay_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 85, 106, 99),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  0,
                  MediaQuery.of(context).size.width * 0.05,
                  0),
              child: Text(
                """Milion Quiz is game aplication base on popular TV show.
Player starting width 1 000 000\$ dividet on 40 packs 25 000\$ each. To win player must answear correctly for eight questions.
Befor each question player choosing between two given question category. Next player have a one minute to distribute cash at question of player choice. However, one answer must always be empty.
The game goes on until the correct answear in the final question or lose all the money""",
                style: TextStyle(
                  fontSize: 19,
                  color: Color.fromARGB(255, 255, 240, 171),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 67, 67, 67))),
              onPressed: () {
                // route to menu screen
                Navigator.pushReplacement(
                    context,
                    (PageTransition(
                        type: PageTransitionType.scale,
                        alignment: Alignment.topCenter,
                        child: welcome_screen(),
                        duration: Duration(milliseconds: 300))));
              },
              child: Text(
                "Back to menu",
                style: TextStyle(color: Color.fromARGB(255, 255, 240, 171)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
