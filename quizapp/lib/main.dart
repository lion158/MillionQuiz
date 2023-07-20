import 'package:flutter/material.dart';
import 'package:quizapp/data.dart';
import 'package:quizapp/screens/loseScreen.dart';
import 'package:quizapp/screens/questions_screen.dart';
import 'package:quizapp/screens/category_screen.dart';
import 'package:quizapp/screens/loading_screen.dart';
import 'package:quizapp/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/screens/winningScreen.dart';

void main() {
  runApp(ChangeNotifierProvider<Data>(
    create: (context) => Data(),
    child: MaterialApp(
      routes: {
        '/': (context) => welcome_screen(),
        '/questions': (context) => questions_screen(),
        '/category': (context) => category_screen(),
        // '/loading': (context) => loading_screen(),
        '/winnigScreen': (context) => winnigScreen(),
        '/lose': (context) => loseScreen(),
      },
    ),
  ));
}

class Data extends ChangeNotifier {
  int q_counter1 = 0;
  int q_counter2 = 1;
  int courent_q_counter = 0;
  List<Final_q> questions = [];
  double accountBalance = 1000000;
  int levelCounter = 1;
  double maxValue = 1000000;

  // to blank or icon of passing level table: true - blank, false - icon
  List<bool> blank = [true, true, true, true, true, true, true, true];
  // to schow lost value
  List<int> lostList = [];
  // to Icons in summary of pessing level table: false- bad mood, true-mood
  List<bool> level = [false, false, false, false, false, false, false, false];

  void resetValue() {
    q_counter1 = 0;
    q_counter2 = 1;
    courent_q_counter = 0;
    questions = [];
    accountBalance = 1000000;
    levelCounter = 1;
    maxValue = 1000000;
    level = [false, false, false, false, false, false, false, false];
    blank = [true, true, true, true, true, true, true, true];
    lostList = [];
    notifyListeners();
  }

  getCounter1() => q_counter1;
  getCounter2() => q_counter2;
  getCounterCourentQ() => courent_q_counter;
  getAccountBalance() => accountBalance;
  getLevelCounter() => levelCounter;
  getMaxValue() => maxValue;
  getBlanklList() => blank;
  getLevelList() => level;
  getLostList() => lostList;

  void updateQuestions(List q) {
    questions = [...q];
  }

  void changeCounter1() {
    q_counter1 = q_counter1 + 2;
    notifyListeners();
  }

  void changeCounter2() {
    q_counter2 = q_counter2 + 2;
    notifyListeners();
  }

  void changeCounterCourentQ(current_question_counter) {
    courent_q_counter = current_question_counter;
    notifyListeners();
  }

  void updateAccountBalance(double value) {
    accountBalance = value;
    notifyListeners();
  }

  void updateBlankList(int value) {
    blank[value] = false;
    notifyListeners();
  }

  void updateLevelList(int value) {
    level[value] = true;
    notifyListeners();
  }

  void AddToLostList(int value) {
    lostList.add(value);
    notifyListeners();
  }

  void updateLevelCounter() {
    levelCounter++;
    notifyListeners();
  }

  void updateMaxValue(double value) {
    maxValue = value;
    notifyListeners();
  }
}
