import 'package:flutter/services.dart';
import 'package:quizapp/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DataBaseHelper {
  late Database _db;

  Future<void> init() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPath = path.join(applicationDirectory.path, "database.db");

    bool database = await io.File(dbPath).exists();

    if (!database) {
      // Copy from asset
      ByteData data = await rootBundle.load(path.join("assets", "database.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(dbPath).writeAsBytes(bytes, flush: true);
    }
    _db = await openDatabase(dbPath);
    print("COPIED!!!!!!!!!!!!!!!!!");
  }

  /// get all the easy questions from database
  Future<List<Easy_q>> easy_q() async {
    // Get a reference to the database.
    final DB = await _db;

    // Query the table for all The easy questions.
    final List<Map<String, dynamic>> maps_easy =
        await DB.query('easy_questions');

    // Convert the List<Map<String, dynamic> into a List<Easy_q>.
    return List.generate(maps_easy.length, (i) {
      return Easy_q(
        id: maps_easy[i]['id'],
        question: maps_easy[i]['name'],
        answear_0: maps_easy[i]['answear_0'],
        answear_1: maps_easy[i]['answear_1'],
        answear_2: maps_easy[i]['answear_2'],
        answear_3: maps_easy[i]['answear_3'],
        correct: maps_easy[i]['correct'],
        category: maps_easy[i]['catagory'],
      );
    });
  }

  /// get all the medium questions from database
  Future<List<Medium_q>> medium_q() async {
    // Get a reference to the database.
    final DB = await _db;

    // Query the table for all The medium questions.
    final List<Map<String, dynamic>> maps_medium = await DB.query('Medium_q');

    // Convert the List<Map<String, dynamic> into a List<Medium_q>.
    return List.generate(maps_medium.length, (i) {
      return Medium_q(
        id: maps_medium[i]['id'],
        question: maps_medium[i]['name'],
        answear_0: maps_medium[i]['answear_0'],
        answear_1: maps_medium[i]['answear_1'],
        answear_2: maps_medium[i]['answear_2'],
        correct: maps_medium[i]['correct'],
        category: maps_medium[i]['catagory'],
      );
    });
  }

  /// get all the hard questions from database
  Future<List<Hard_q>> hard_q() async {
    // Get a reference to the database.
    final DB = await _db;

    // Query the table for all The hard questions.
    final List<Map<String, dynamic>> maps_hard =
        await DB.query('hard_questions');

    // Convert the List<Map<String, dynamic> into a List<Hard_q>.
    return List.generate(maps_hard.length, (i) {
      return Hard_q(
        id: maps_hard[i]['id'],
        question: maps_hard[i]['name'],
        answear_0: maps_hard[i]['answear_0'],
        answear_1: maps_hard[i]['answear_1'],
        correct: maps_hard[i]['correct'],
        category: maps_hard[i]['catagory'],
      );
    });
  }
}
