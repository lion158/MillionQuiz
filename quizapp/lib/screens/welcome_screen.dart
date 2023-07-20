import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/database_helper.dart';
import 'package:quizapp/data.dart';
import 'package:quizapp/helper.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/screens/category_screen.dart';
import 'package:quizapp/screens/how_to_play_screen.dart';

import 'package:quizapp/screens/questions_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quizapp/screens/welcome_screen.dart';

class welcome_screen extends StatefulWidget {
  const welcome_screen({Key? key}) : super(key: key);

  @override
  _welcome_screenState createState() => _welcome_screenState();
}

class _welcome_screenState extends State<welcome_screen> {
  DbHelper dbhelper = new DbHelper();
  @override
  List<String> l2 = [];
  double currentvalue = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 85, 106, 99),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Milion Qiuz',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 240, 171)),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(500.0),
                    clipBehavior: Clip.hardEdge,
                    child: Image(
                      image: AssetImage('assets/money3.jpg'),
                    )),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () async {
                Provider.of<Data>(context, listen: false).resetValue();
                await dbhelper.initDB();
                List<Final_q> x = [];
                x = await dbhelper.final_q();
                print(x[0].question);
                print(x[0].category);
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.scale,
                        alignment: Alignment.bottomCenter,
                        child: category_screen(),
                        duration: Duration(milliseconds: 300)));
                Provider.of<Data>(context, listen: false).updateQuestions(x);
              },
              child: Text(
                'Start Game',
                style: TextStyle(color: Color.fromARGB(255, 255, 240, 171)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 67, 67, 67)),
                  minimumSize: MaterialStateProperty.all(Size(180, 40))),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.scale,
                        alignment: Alignment.bottomCenter,
                        child: howToPlay_screen(),
                        duration: Duration(milliseconds: 300)));
              },
              child: Text(
                'How to play',
                style: TextStyle(color: Color.fromARGB(255, 255, 240, 171)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 67, 67, 67),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(180, 40))),
            ),
          ],
        ),
      ),
    );
  }
}
