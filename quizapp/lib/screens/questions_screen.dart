import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/data.dart';
import 'package:quizapp/database_helper.dart';
import 'package:quizapp/helper.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/screens/category_screen.dart';
import 'package:quizapp/screens/loseScreen.dart';
import 'package:quizapp/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quizapp/screens/winningScreen.dart';

class questions_screen extends StatefulWidget {
  questions_screen({Key? key}) : super(key: key);

  @override
  _questions_screenState createState() => _questions_screenState();
}

class _questions_screenState extends State<questions_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late Animation _stoperAnimation;
  late Animation _false_answear_animation;
  @override
  int animationDurationTime = 60;
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(seconds: animationDurationTime), vsync: this);
    _stoperAnimation = Tween(begin: 1.0, end: 0.0).animate(_controller);
    _controller.addListener(() {
      print(_controller.value);
    });
    _false_answear_animation =
        Tween(begin: _currentSliderValue1, end: 0.0).animate(_controller);
  }

  @override

  //sliders
  double _currentSliderValue1 = 0;
  double _currentSliderValue2 = 0;
  double _currentSliderValue3 = 0;
  double _currentSliderValue4 = 0;

  double _finalSliderValue1 = 1000000;
  double _finalSliderValue2 = 1000000;
  double _finalSliderValue3 = 1000000;
  double _finalSliderValue4 = 1000000;

  double plus(
      double currentSliderValue,
      double maxValue,
      double otherSliderValue1,
      double otherSliderValue2,
      double otherSliderValue3,
      int levelCounter) {
    if (levelCounter <= 4) {
      if (currentSliderValue <= maxValue - 25000 &&
          otherSliderValue1 +
                  otherSliderValue2 +
                  otherSliderValue3 +
                  currentSliderValue <
              maxValue &&
          (otherSliderValue1 == 0 ||
              otherSliderValue2 == 0 ||
              otherSliderValue3 == 0)) {
        currentSliderValue = currentSliderValue + 25000;
      }
      return currentSliderValue;
    } else if (levelCounter >= 5 && levelCounter <= 7) {
      if (currentSliderValue <= maxValue - 25000 &&
          otherSliderValue1 + otherSliderValue2 + currentSliderValue <
              maxValue &&
          (otherSliderValue1 == 0 || otherSliderValue2 == 0)) {
        currentSliderValue = currentSliderValue + 25000;
      }
      return currentSliderValue;
    } else {
      if (currentSliderValue <= maxValue - 25000 &&
          otherSliderValue1 + currentSliderValue < maxValue &&
          otherSliderValue1 == 0) {
        currentSliderValue = currentSliderValue + 25000;
      }
      return currentSliderValue;
    }
  }

  double minus(currentSliderValue) {
    if (currentSliderValue >= 25000) {
      currentSliderValue = currentSliderValue - 25000;
    }

    return currentSliderValue;
  }

  // answear colors change
  bool _a0Color = false;
  bool _a1Color = false;
  bool _a2Color = false;
  bool _a3Color = false;

  // button pressed
  bool _hasBeenPressed = false;
  // schowing Question
  bool _schowQuestion = false;
  // changing button text
  bool _stopButton = false;

  //stop posibility to change sliders
  bool _slider = false;

  //stop posibility to press button
  bool _button = false;

  Widget build(BuildContext context) {
    // curent level counter
    int _levelCounter = Provider.of<Data>(context).getLevelCounter();
    // current question counter
    int current_question_counter =
        Provider.of<Data>(context).getCounterCourentQ();

    // question
    String q =
        Provider.of<Data>(context).questions[current_question_counter].question;

    //helper variable to answear
    var s_a_0 = Provider.of<Data>(context)
        .questions[current_question_counter]
        .answear_0;
    var s_a_1 = Provider.of<Data>(context)
        .questions[current_question_counter]
        .answear_1;
    var s_a_2 = Provider.of<Data>(context)
        .questions[current_question_counter]
        .answear_2;
    // answears
    String a_0 = (s_a_0 == null) ? '' : s_a_0;
    String a_1 = (s_a_1 == null) ? '' : s_a_1;
    String a_2 = (s_a_2 == null) ? '' : s_a_2;
    String? a_3 = (Provider.of<Data>(context)
                .questions[current_question_counter]
                .answear_3 ==
            null)
        ? ''
        : Provider.of<Data>(context)
            .questions[current_question_counter]
            .answear_3;
    // corect question
    int _correctQ =
        Provider.of<Data>(context).questions[current_question_counter].correct;

    // account balance
    double _accountBalance = Provider.of<Data>(context).accountBalance;
    double _StartingAccountBalance = Provider.of<Data>(context).accountBalance;

    // lost value
    double _lostValue = 0;

    // max Value to sliders
    final double maxValue = Provider.of<Data>(context).getMaxValue();

    //divisions to sliders
    double divisions = maxValue / 25000;

    // false answear to zero function
    void toZero(int correctQ) {
      if (correctQ == 0) {
        _a1Color = true;
        _a2Color = true;
        _a3Color = true;
        _currentSliderValue2 = 0;
        _currentSliderValue3 = 0;
        _currentSliderValue4 = 0;
      }
      if (correctQ == 1) {
        _a0Color = true;
        _a2Color = true;
        _a3Color = true;
        _currentSliderValue1 = 0;
        _currentSliderValue3 = 0;
        _currentSliderValue4 = 0;
      }
      if (correctQ == 2) {
        _a1Color = true;
        _a0Color = true;
        _a3Color = true;
        _currentSliderValue2 = 0;
        _currentSliderValue1 = 0;
        _currentSliderValue4 = 0;
      }
      if (correctQ == 3) {
        _a1Color = true;
        _a2Color = true;
        _a0Color = true;
        _currentSliderValue2 = 0;
        _currentSliderValue3 = 0;
        _currentSliderValue1 = 0;
      }
    }

    //check function updating account balance
    void checkFunctionUpdateAccountBalance(int correctQ) {
      if (correctQ == 0) {
        Provider.of<Data>(context, listen: false)
            .updateAccountBalance(_finalSliderValue1);
      }
      if (correctQ == 1) {
        Provider.of<Data>(context, listen: false)
            .updateAccountBalance(_finalSliderValue2);
      }
      if (correctQ == 2) {
        Provider.of<Data>(context, listen: false)
            .updateAccountBalance(_finalSliderValue3);
      }
      if (correctQ == 3) {
        Provider.of<Data>(context, listen: false)
            .updateAccountBalance(_finalSliderValue4);
      }
      print('account balance: ${_accountBalance}');
    }

    // TEST
    String text = _stopButton ? 'stop' : 'start';

    // size of answear font
    double _answearSize = 23;

    // size of value font
    double _valueSize = 16;

    // width of screen
    double _widthOfScreen = MediaQuery.of(context).size.width;

    // usuń
    int counter1 = Provider.of<Data>(context).getCounter1();
    int counter2 = Provider.of<Data>(context).getCounter2();

    double _sizeBox = 30;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 208, 192),
      body: //SafeArea(
          //child:
          Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 85, 106, 99),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: (() {
                        if (mounted) {
                          setState(() {
                            _controller.stop();
                          });
                        }

                        Navigator.pushReplacement(
                            context,
                            (PageTransition(
                                type: PageTransitionType.scale,
                                alignment: Alignment.topCenter,
                                child: welcome_screen(),
                                duration: Duration(milliseconds: 300))));
                      }),
                      color: Color.fromARGB(255, 255, 240, 171),
                    ),
                    title: Text(
                      'Question $_levelCounter/8',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 240, 171),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.05,
                        0,
                        MediaQuery.of(context).size.width * 0.05,
                        0),
                    child: Container(
                      height: 105,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          _schowQuestion ? q : '',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 255, 240, 171)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: _sizeBox,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    a_0,
                    style: TextStyle(
                      fontSize: _answearSize,
                      color: _a0Color
                          ? Colors.red
                          : Color.fromARGB(255, 67, 67, 67),
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              // Row(
              //   children: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    '\$' + _currentSliderValue1.round().toString(),
                    style: TextStyle(
                        fontSize: _valueSize,
                        color: Color.fromARGB(255, 67, 67, 67)),
                  )),
            ],
          ),
          AbsorbPointer(
            absorbing: _slider,
            child: Slider(
              value: _currentSliderValue1,
              min: 0,
              max: maxValue,
              divisions: divisions.toInt(),
              label: _currentSliderValue1.round().toString(),
              activeColor: Color.fromARGB(255, 255, 240, 171),
              onChanged: (double value) {
                if (_currentSliderValue1 <= _finalSliderValue1) {
                  if (_levelCounter <= 4) {
                    if ((value +
                                _currentSliderValue2 +
                                _currentSliderValue3 +
                                _currentSliderValue4) <=
                            _accountBalance &&
                        (_currentSliderValue2 == 0 ||
                            _currentSliderValue3 == 0 ||
                            _currentSliderValue4 == 0)) {
                      if (mounted) {
                        setState(() {
                          _currentSliderValue1 = value;
                        });
                      }
                    }
                  } else if (_levelCounter >= 5 && _levelCounter <= 7) {
                    if ((value + _currentSliderValue2 + _currentSliderValue3) <=
                            _accountBalance &&
                        (_currentSliderValue2 == 0 ||
                            _currentSliderValue3 == 0)) {
                      if (mounted) {
                        setState(() {
                          _currentSliderValue1 = value;
                        });
                      }
                    }
                  } else {
                    if ((value + _currentSliderValue2) <= _accountBalance &&
                        _currentSliderValue2 == 0) {
                      if (mounted) {
                        setState(() {
                          _currentSliderValue1 = value;
                        });
                      }
                    }
                  }
                }
              },
            ),
          ),
          SizedBox(
            height: _sizeBox,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      a_1,
                      style: TextStyle(
                        fontSize: _answearSize,
                        color: _a1Color
                            ? Colors.red
                            : Color.fromARGB(255, 67, 67, 67),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    '\$' + _currentSliderValue2.round().toString(),
                    style: TextStyle(
                        fontSize: _valueSize,
                        color: Color.fromARGB(255, 67, 67, 67)),
                  )),
            ],
          ),
          AbsorbPointer(
            absorbing: _slider,
            child: Slider(
              value: _currentSliderValue2,
              min: 0,
              max: maxValue,
              divisions: divisions.toInt(),
              label: _currentSliderValue2.round().toString(),
              activeColor: Color.fromARGB(255, 255, 240, 171),
              onChanged: (double value) {
                if (_currentSliderValue2 <= _finalSliderValue2) {
                  if (_levelCounter <= 4) {
                    if ((value +
                                _currentSliderValue1 +
                                _currentSliderValue3 +
                                _currentSliderValue4) <=
                            _accountBalance &&
                        (_currentSliderValue1 == 0 ||
                            _currentSliderValue3 == 0 ||
                            _currentSliderValue4 == 0)) {
                      if (mounted) {
                        setState(() {
                          _currentSliderValue2 = value;
                        });
                      }
                    }
                  } else if (_levelCounter >= 5 && _levelCounter <= 7) {
                    if ((value + _currentSliderValue1 + _currentSliderValue3) <=
                            _accountBalance &&
                        (_currentSliderValue1 == 0 ||
                            _currentSliderValue3 == 0)) {
                      if (mounted) {
                        setState(() {
                          _currentSliderValue2 = value;
                        });
                      }
                    }
                  } else {
                    if ((value + _currentSliderValue1) <= _accountBalance &&
                        _currentSliderValue1 == 0) {
                      if (mounted) {
                        setState(() {
                          _currentSliderValue2 = value;
                        });
                      }
                    }
                  }
                }
              },
            ),
          ),
          SizedBox(
            height: _sizeBox,
          ),
          if (_levelCounter <= 7) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        a_2,
                        style: TextStyle(
                          fontSize: _answearSize,
                          color: _a2Color
                              ? Colors.red
                              : Color.fromARGB(255, 67, 67, 67),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      '\$' + _currentSliderValue3.round().toString(),
                      style: TextStyle(
                          fontSize: _valueSize,
                          color: Color.fromARGB(255, 67, 67, 67)),
                    )),
              ],
            ),
            AbsorbPointer(
              absorbing: _slider,
              child: Slider(
                value: _currentSliderValue3,
                min: 0,
                max: maxValue,
                divisions: divisions.toInt(),
                label: _currentSliderValue3.round().toString(),
                activeColor: Color.fromARGB(255, 255, 240, 171),
                onChanged: (double value) {
                  if (_currentSliderValue3 <= _finalSliderValue3) {
                    if (_levelCounter <= 4) {
                      if ((value +
                                  _currentSliderValue2 +
                                  _currentSliderValue1 +
                                  _currentSliderValue4) <=
                              _accountBalance &&
                          (_currentSliderValue2 == 0 ||
                              _currentSliderValue1 == 0 ||
                              _currentSliderValue4 == 0)) {
                        if (mounted) {
                          setState(() {
                            _currentSliderValue3 = value;
                          });
                        }
                      }
                    } else if (_levelCounter >= 5 && _levelCounter <= 7) {
                      if ((value +
                                  _currentSliderValue2 +
                                  _currentSliderValue1) <=
                              _accountBalance &&
                          (_currentSliderValue2 == 0 ||
                              _currentSliderValue1 == 0)) {
                        if (mounted) {
                          setState(() {
                            _currentSliderValue3 = value;
                          });
                        }
                      }
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: _sizeBox,
            ),
          ],
          if (_levelCounter <= 4) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        a_3!,
                        style: TextStyle(
                          fontSize: _answearSize,
                          color: _a3Color
                              ? Colors.red
                              : Color.fromARGB(255, 67, 67, 67),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text('\$' + _currentSliderValue4.round().toString(),
                        style: TextStyle(
                            fontSize: _valueSize,
                            color: Color.fromARGB(255, 67, 67, 67)))),
              ],
            ),
            AbsorbPointer(
              absorbing: _slider,
              child: Slider(
                value: _currentSliderValue4,
                min: 0,
                max: maxValue,
                divisions: divisions.toInt(),
                label: _currentSliderValue4.round().toString(),
                activeColor: Color.fromARGB(255, 255, 240, 171),
                onChanged: (double value) {
                  if (_currentSliderValue4 <= _finalSliderValue4) {
                    if ((value +
                                _currentSliderValue1 +
                                _currentSliderValue2 +
                                _currentSliderValue3) <=
                            _accountBalance &&
                        (_currentSliderValue1 == 0 ||
                            _currentSliderValue2 == 0 ||
                            _currentSliderValue3 == 0)) {
                      if (mounted) {
                        setState(() {
                          _currentSliderValue4 = value;
                        });
                      }
                    }
                  }
                },
              ),
            ),
          ],
          SizedBox(
            height: 2,
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, _) {
                return LinearProgressIndicator(
                  color: Color.fromARGB(255, 85, 106, 99),
                  backgroundColor: Color.fromARGB(255, 67, 67, 67),
                  minHeight: 40,
                  value: _stoperAnimation.value,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: (_widthOfScreen * 0.415)),
            child: AbsorbPointer(
              absorbing: _button,
              child: TextButton(
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _hasBeenPressed = !_hasBeenPressed;

                        print(_hasBeenPressed);
                      });
                    }

                    print(_hasBeenPressed);

                    if (_hasBeenPressed) {
                      if (mounted) {
                        setState(() {
                          _controller.forward();
                          _schowQuestion = true;
                          _stopButton = true;
                        });
                      }
                    }
                    Future.delayed(Duration(seconds: animationDurationTime),
                        () {
                      if (mounted) {
                        setState(() {
                          // saving actual values
                          _finalSliderValue1 = _currentSliderValue1;
                          _finalSliderValue2 = _currentSliderValue2;
                          _finalSliderValue3 = _currentSliderValue3;
                          _finalSliderValue4 = _currentSliderValue4;
                          if (_hasBeenPressed &&
                              _stoperAnimation.value == 0.0) {
                            _slider = true;
                          }
                        });
                      }
                    });
                    Future.delayed(Duration(seconds: animationDurationTime + 1),
                        () {
                      // changing to saves at the end values
                      if (mounted) {
                        setState(() {
                          _currentSliderValue1 = _finalSliderValue1;
                          _currentSliderValue2 = _finalSliderValue2;
                          _currentSliderValue3 = _finalSliderValue3;
                          _currentSliderValue4 = _finalSliderValue4;
                        });
                      }
                    });
                    Future.delayed(Duration(seconds: animationDurationTime + 3),
                        () {
                      // changing false answear value to 0 and changing color
                      if (mounted) {
                        setState(() {
                          toZero(_correctQ);
                        });
                      }
                    });

                    Future.delayed(Duration(seconds: animationDurationTime + 7),
                        () {
                      if (_hasBeenPressed =
                          true && _stoperAnimation.value == 0.0) {
                        if (mounted) {
                          setState(() {
                            //Future.delayed(Duration(seconds: 10), (() {
                            Provider.of<Data>(context, listen: false)
                                .updateLevelCounter();

                            print('LEVEL: ${_levelCounter}');
                            // update account balance
                            if (mounted) {
                              setState(() {
                                checkFunctionUpdateAccountBalance(_correctQ);
                              });
                            }

                            // updated acoount balance
                            _accountBalance =
                                Provider.of<Data>(context, listen: false)
                                    .getAccountBalance();

                            //calculate and add to list lost value:
                            _lostValue =
                                (_StartingAccountBalance - _accountBalance) /
                                    1000;
                            Provider.of<Data>(context, listen: false)
                                .AddToLostList(_lostValue.toInt());

                            // Update (level list) - Icons true/false list:
                            if (_StartingAccountBalance == _accountBalance) {
                              Provider.of<Data>(context, listen: false)
                                  .updateBlankList(_levelCounter - 1);
                              Provider.of<Data>(context, listen: false)
                                  .updateLevelList(_levelCounter - 1);
                            } else {
                              Provider.of<Data>(context, listen: false)
                                  .updateBlankList(_levelCounter - 1);
                            }
                            //category screen
                            if (_levelCounter < 8 && _accountBalance > 0) {
                              Navigator.pushReplacement(
                                  context,
                                  (PageTransition(
                                      type: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                      child: category_screen(),
                                      duration: Duration(milliseconds: 300))));
                            } else if (_levelCounter == 8 &&
                                _accountBalance > 0) {
                              //winnig screen
                              Navigator.pushReplacement(
                                  context,
                                  (PageTransition(
                                      type: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                      child: winnigScreen(),
                                      duration: Duration(milliseconds: 300))));
                            } else {
                              //lose screen
                              Navigator.pushReplacement(
                                  context,
                                  (PageTransition(
                                      type: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                      child: loseScreen(),
                                      duration: Duration(milliseconds: 300))));
                            }
                            //}));
                          });
                        }
                      }
                    });

                    if (_hasBeenPressed == false) {
                      if (mounted) {
                        setState(() {
                          _controller.stop();
                          _slider = true;
                          _button = true;
                          // saving actual values
                          _finalSliderValue1 = _currentSliderValue1;
                          _finalSliderValue2 = _currentSliderValue2;
                          _finalSliderValue3 = _currentSliderValue3;
                          _finalSliderValue4 = _currentSliderValue4;

                          Future.delayed(Duration(seconds: 3), () {
                            // changing false answear value to 0 and changing color
                            if (mounted) {
                              setState(() {
                                toZero(_correctQ);
                                _slider = true;
                              });
                            }
                          });

                          Future.delayed(Duration(seconds: 7), (() {
                            Provider.of<Data>(context, listen: false)
                                .updateLevelCounter();

                            print('LEVEL: ${_levelCounter}');

                            // update account balance
                            if (mounted) {
                              setState(() {
                                checkFunctionUpdateAccountBalance(_correctQ);
                              });
                            }

                            // updated acoount balance
                            _accountBalance =
                                Provider.of<Data>(context, listen: false)
                                    .getAccountBalance();

                            //calculate and add to list lost value:
                            _lostValue =
                                (_StartingAccountBalance - _accountBalance) /
                                    1000;
                            Provider.of<Data>(context, listen: false)
                                .AddToLostList(_lostValue.toInt());

                            // Update (level list) - Icons true/false list:
                            if (_StartingAccountBalance == _accountBalance) {
                              Provider.of<Data>(context, listen: false)
                                  .updateBlankList(_levelCounter - 1);
                              Provider.of<Data>(context, listen: false)
                                  .updateLevelList(_levelCounter - 1);
                            } else {
                              Provider.of<Data>(context, listen: false)
                                  .updateBlankList(_levelCounter - 1);
                            }

                            //category screen
                            if (_levelCounter < 8 && _accountBalance > 0) {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                      child: category_screen(),
                                      duration: Duration(milliseconds: 300)));
                            } else if (_levelCounter == 8 &&
                                _accountBalance > 0) {
                              //winnig screen
                              Navigator.of(context).pushReplacement(
                                  PageTransition(
                                      type: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                      child: winnigScreen(),
                                      duration: Duration(milliseconds: 300)));
                              ;
                            } else {
                              //lose screen
                              Navigator.pushReplacement(
                                  context,
                                  (PageTransition(
                                      type: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                      child: loseScreen(),
                                      duration: Duration(milliseconds: 300))));
                            }
                          }));
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,

                    //minsize: Size(.....)
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 255, 240, 171)),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
