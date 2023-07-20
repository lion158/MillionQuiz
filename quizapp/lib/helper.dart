import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'data.dart';

class DbHelper {
  Future initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "database.db");
    final exist = await databaseExists(path);

    if (exist) {
      // database already exists, open database
      print("db already exists");
      await openDatabase(path);
    } else {
      // db does not exists create a new one
      print("creating a copy from assets");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "database.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
      print("db copied");
    }

    await openDatabase(path);
  }

  /// get all the easy questions from database
  Future<List<Easy_q>> easy_q() async {
    // Get a reference to the database.
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "database.db");
    final DB = await openDatabase(path);

    // Query the table for all The easy questions.
    final List<Map<String, dynamic>> maps_easy = await DB.query('Easy_q');

    // Convert the List<Map<String, dynamic> into a List<Easy_q>.
    return List.generate(maps_easy.length, (i) {
      return Easy_q(
        id: maps_easy[i]['id'],
        question: maps_easy[i]['question'],
        answear_0: maps_easy[i]['answer_0'],
        answear_1: maps_easy[i]['answer_1'],
        answear_2: maps_easy[i]['answer_2'],
        answear_3: maps_easy[i]['answer_3'],
        correct: maps_easy[i]['correct'],
        category: maps_easy[i]['category'],
      );
    });
  }

  /// get all the medium questions from database
  Future<List<Medium_q>> medium_q() async {
    // Get a reference to the database.
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "database.db");
    final DB = await openDatabase(path);

    // Query the table for all The easy questions.
    final List<Map<String, dynamic>> maps_medium = await DB.query('Medium_q');

    // Convert the List<Map<String, dynamic> into a List<Easy_q>.
    return List.generate(maps_medium.length, (i) {
      return Medium_q(
        id: maps_medium[i]['id'],
        question: maps_medium[i]['question'],
        answear_0: maps_medium[i]['answer_0'],
        answear_1: maps_medium[i]['answer_1'],
        answear_2: maps_medium[i]['answer_2'],
        correct: maps_medium[i]['correct'],
        category: maps_medium[i]['category'],
      );
    });
  }

  /// get all the hard questions from database
  Future<List<Hard_q>> hard_q() async {
    // Get a reference to the database.
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "database.db");
    final DB = await openDatabase(path);

    // Query the table for all The easy questions.
    final List<Map<String, dynamic>> maps_hard = await DB.query('Hard_q');

    // Convert the List<Map<String, dynamic> into a List<Easy_q>.
    return List.generate(maps_hard.length, (i) {
      return Hard_q(
        id: maps_hard[i]['id'],
        question: maps_hard[i]['question'],
        answear_0: maps_hard[i]['answer_0'],
        answear_1: maps_hard[i]['answer_1'],
        correct: maps_hard[i]['correct'],
        category: maps_hard[i]['category'],
      );
    });
  }

  //drow all the final questions
  Future<List<Final_q>> final_q() async {
    ///musi być return
    // Get a reference to the database.
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "database.db");
    final DB = await openDatabase(path);

    // query for all the questions
    List<Easy_q> l_easy_q = await easy_q();
    List<Medium_q> l_medium_q = await medium_q();
    List<Hard_q> l_hard_q = await hard_q();

    //draw questions to each level
    List<String> l_category = [];
    int id_value;
    bool is_in_list;
    var l_easy_q_lenght = l_easy_q.length;
    var l_medium_q_lenght = l_medium_q.length;
    var l_hard_q_lenght = l_hard_q.length;

    // make sure to draw different category questions
    int diffrent_easy(int l_lenght, List l_category, List<Easy_q> l_questions) {
      bool is_in_list;
      int id_value;
      do {
        id_value = Random().nextInt(l_lenght);
        is_in_list = l_category.contains(l_questions[id_value].category);
      } while (is_in_list != false);
      return id_value;
    }

    int diffrent_medium(
        int l_lenght, List l_category, List<Medium_q> l_questions) {
      bool is_in_list;
      int id_value;
      do {
        id_value = Random().nextInt(l_lenght);
        is_in_list = l_category.contains(l_questions[id_value].category);
      } while (is_in_list != false);
      return id_value;
    }

    int diffrent_hard(int l_lenght, List l_category, List<Hard_q> l_questions) {
      bool is_in_list;
      int id_value;
      do {
        id_value = Random().nextInt(l_lenght);
        is_in_list = l_category.contains(l_questions[id_value].category);
      } while (is_in_list != false);
      return id_value;
    }

    List<Final_q> l_final_q = []; // List of final questions

    //drawing 8 easy questions
    for (int i = 0; i < 8; i++) {
      // draw category function:
      int draw_id = diffrent_easy(l_easy_q_lenght, l_category, l_easy_q);

      // adding new catogory to list of categry
      l_category.add(l_easy_q[draw_id].category);

      //adding new questions to list of finals questions
      var easy_q_final = Final_q(
          id: l_easy_q[draw_id].id,
          question: l_easy_q[draw_id].question,
          correct: l_easy_q[draw_id].correct,
          category: l_easy_q[draw_id].category,
          answear_0: l_easy_q[draw_id].answear_0,
          answear_1: l_easy_q[draw_id].answear_1,
          answear_2: l_easy_q[draw_id].answear_2,
          answear_3: l_easy_q[draw_id].answear_3);

      l_final_q.add(easy_q_final);
    }

    //drawing 6 medium questions
    for (var i = 0; i < 6; i++) {
      //draw category function
      int draw_id = diffrent_medium(l_medium_q_lenght, l_category, l_medium_q);

      // adding new category to list of category
      l_category.add(l_medium_q[draw_id].category);

      //adding new question to list of final results
      var medium_q_final = Final_q(
          id: l_medium_q[draw_id].id,
          question: l_medium_q[draw_id].question,
          correct: l_medium_q[draw_id].correct,
          category: l_medium_q[draw_id].category,
          answear_0: l_medium_q[draw_id].answear_0,
          answear_1: l_medium_q[draw_id].answear_1,
          answear_2: l_medium_q[draw_id].answear_2);

      l_final_q.add(medium_q_final);
    }

    //drawing 2 hard questions
    for (var i = 0; i < 2; i++) {
      //draw category function
      var draw_id = diffrent_hard(l_hard_q_lenght, l_category, l_hard_q);

      //adding new category to list of category
      l_category.add(l_hard_q[draw_id].category);

      //adding new question to list of finals result
      var hard_q_final = Final_q(
          id: l_hard_q[draw_id].id,
          question: l_hard_q[draw_id].question,
          correct: l_hard_q[draw_id].correct,
          category: l_hard_q[draw_id].category,
          answear_0: l_hard_q[draw_id].answear_0,
          answear_1: l_hard_q[draw_id].answear_1);

      l_final_q.add(hard_q_final);
    }

    // returnig list of final questions
    return l_final_q;
  }
}
