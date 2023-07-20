import 'dart:core';

class Easy_q {
  var id;
  String question;
  String answear_0;
  String answear_1;
  String answear_2;
  String answear_3;
  int correct;
  String category;

  Easy_q(
      {required this.id,
      required this.question,
      required this.answear_0,
      required this.answear_1,
      required this.answear_2,
      required this.answear_3,
      required this.correct,
      required this.category});

  Easy_q.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        question = res["question"],
        answear_0 = res["answear_0"],
        answear_1 = res["answear_1"],
        answear_2 = res["answear_2"],
        answear_3 = res["answear_3"],
        correct = res["correct"],
        category = res["category"];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'question': question,
      'answear_0': answear_0,
      'answear_1': answear_1,
      'answear_2': answear_2,
      'answear_3': answear_3,
      'correct': correct,
      'category': category
    };
  }
}

class Medium_q {
  Medium_q(
      {required this.id,
      required this.question,
      required this.answear_0,
      required this.answear_1,
      required this.answear_2,
      required this.correct,
      required this.category});

  var id;
  String question;
  String answear_0;
  String answear_1;
  String answear_2;
  int correct;
  String category;

  Medium_q.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        question = res["question"],
        answear_0 = res["answear_0"],
        answear_1 = res["answear_1"],
        answear_2 = res["answear_2"],
        correct = res["correct"],
        category = res["category"];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'question': question,
      'answear_0': answear_0,
      'answear_1': answear_1,
      'answear_2': answear_2,
      'correct': correct,
      'category': category
    };
  }
}

class Hard_q {
  var id;
  String question;
  String answear_0;
  String answear_1;
  int correct;
  String category;

  Hard_q(
      {required this.id,
      required this.question,
      required this.answear_0,
      required this.answear_1,
      required this.correct,
      required this.category});

  Hard_q.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        question = res["question"],
        answear_0 = res["answear_0"],
        answear_1 = res["answear_1"],
        correct = res["correct"],
        category = res["category"];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'question': question,
      'answear_0': answear_0,
      'answear_1': answear_1,
      'correct': correct,
      'category': category
    };
  }
}

class Final_q {
  var id;
  String question;
  String? answear_0;
  String? answear_1;
  String? answear_2;
  String? answear_3;
  int correct;
  String category;

  Final_q(
      {required this.id,
      required this.question,
      this.answear_0,
      this.answear_1,
      this.answear_2,
      this.answear_3,
      required this.correct,
      required this.category});

  Final_q.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        question = res["question"],
        answear_0 = res["answear_0"],
        answear_1 = res["answear_1"],
        answear_2 = res["answear_2"],
        answear_3 = res["answear_3"],
        correct = res["correct"],
        category = res["category"];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'question': question,
      'answear_0': answear_0,
      'answear_1': answear_1,
      'answear_2': answear_2,
      'answear_3': answear_3,
      'correct': correct,
      'category': category
    };
  }
}
