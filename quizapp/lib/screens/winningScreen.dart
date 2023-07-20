import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quizapp/screens/welcome_screen.dart';

class winnigScreen extends StatefulWidget {
  const winnigScreen({Key? key}) : super(key: key);

  @override
  State<winnigScreen> createState() => _winnigScreenState();
}

class _winnigScreenState extends State<winnigScreen> {
  @override
  Widget build(BuildContext context) {
    // levels category counters
    int counter1 = Provider.of<Data>(context).getCounter1();
    int counter2 = Provider.of<Data>(context).getCounter2();
    // current question counter
    int current_counter = Provider.of<Data>(context).getCounterCourentQ();

    int _levelCounter = Provider.of<Data>(context).getLevelCounter();

    double _accountBalance = Provider.of<Data>(context).getAccountBalance();

    List<bool> _blank = Provider.of<Data>(context).getBlanklList();
    List<bool> _levelList = Provider.of<Data>(context).getLevelList();
    List<Icon> _iconList = [];
    List<int> _lostList = Provider.of<Data>(context).getLostList();

    for (int i = 0; i < 8; i++) {
      _iconList.add(_levelList[i]
          ? Icon(
              Icons.sentiment_satisfied_alt_sharp,
              color: Color.fromARGB(255, 255, 240, 171),
              size: 30,
            )
          : Icon(
              Icons.sentiment_dissatisfied_sharp,
              color: Color.fromARGB(255, 255, 240, 171),
              size: 30,
            ));
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 208, 192),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 106, 99),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                (PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.topCenter,
                    child: welcome_screen(),
                    duration: Duration(milliseconds: 300))));
          },
        ),
        centerTitle: true,
        title: const Text(
          '',
          style: TextStyle(color: const Color.fromARGB(255, 255, 240, 171)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'CONGRATULATIONS',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 67, 67, 67),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'YOU WON',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 67, 67, 67),
                  fontWeight: FontWeight.bold),
            ),
            Text(_accountBalance.toInt().toString() + ' \$',
                style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(255, 67, 67, 67),
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: const Text(
                          'Q1',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: const Text(
                          'Q2',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: const Text(
                          'Q3',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: const Text(
                          'Q4',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: const Text(
                          'Q5',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: const Text(
                          'Q6',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: const Text(
                          'Q7',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: const Text(
                          'Q8',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                          child: _blank[0]
                              ? Text('')
                              : Text(
                                  '-' + _lostList[0].toString() + ' TYS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 240, 171)),
                                )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                          child: _blank[1]
                              ? Text('')
                              : Text(
                                  '-' + _lostList[1].toString() + ' TYS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 240, 171)),
                                )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                          child: _blank[2]
                              ? Text('')
                              : Text(
                                  '-' + _lostList[2].toString() + ' TYS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 240, 171)),
                                )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                          child: _blank[3]
                              ? Text('')
                              : Text(
                                  '-' + _lostList[3].toString() + ' TYS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 240, 171)),
                                )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                          child: _blank[4]
                              ? Text('')
                              : Text(
                                  '-' + _lostList[4].toString() + ' TYS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 240, 171)),
                                )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                          child: _blank[5]
                              ? Text('')
                              : Text(
                                  '-' + _lostList[5].toString() + ' TYS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 240, 171)),
                                )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                          child: _blank[6]
                              ? Text('')
                              : Text(
                                  '-' + _lostList[6].toString() + ' TYS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 240, 171)),
                                )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 67, 67, 67)),
                        color: Color.fromARGB(255, 85, 106, 99),
                      ),
                      width: 40,
                      height: 40,
                      child: Center(
                          child: _blank[7]
                              ? Text('')
                              : Text(
                                  '-' + _lostList[7].toString() + ' TYS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 240, 171)),
                                )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 67, 67, 67)),
                            color: Color.fromARGB(255, 85, 106, 99)),
                        width: 40,
                        height: 40,
                        child: _blank[0] ? Text('') : _iconList[0]),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 67, 67, 67)),
                            color: Color.fromARGB(255, 85, 106, 99)),
                        width: 40,
                        height: 40,
                        child: _blank[1] ? Text('') : _iconList[1]),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 67, 67, 67)),
                            color: Color.fromARGB(255, 85, 106, 99)),
                        width: 40,
                        height: 40,
                        child: _blank[2] ? Text('') : _iconList[2]),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 67, 67, 67)),
                            color: Color.fromARGB(255, 85, 106, 99)),
                        width: 40,
                        height: 40,
                        child: _blank[3] ? Text('') : _iconList[3]),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 67, 67, 67)),
                            color: Color.fromARGB(255, 85, 106, 99)),
                        width: 40,
                        height: 40,
                        child: _blank[4] ? Text('') : _iconList[4]),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 67, 67, 67)),
                            color: Color.fromARGB(255, 85, 106, 99)),
                        width: 40,
                        height: 40,
                        child: _blank[5] ? Text('') : _iconList[5]),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 67, 67, 67)),
                            color: Color.fromARGB(255, 85, 106, 99)),
                        width: 40,
                        height: 40,
                        child: _blank[6] ? Text('') : _iconList[6]),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 67, 67, 67)),
                            color: Color.fromARGB(255, 85, 106, 99)),
                        width: 40,
                        height: 40,
                        child: _blank[7] ? Text('') : _iconList[7]),
                  ],
                )
              ],
            ),
            const SizedBox(
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
                'MENU',
                style: const TextStyle(
                  color: const Color.fromARGB(255, 255, 240, 171),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
