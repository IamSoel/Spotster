import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sportster/models/register_model.dart';
import 'package:sportster/resources/repository/repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDbProvider implements Source {
  Database db;
  UserDbProvider() {
    init();
  }

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'UsedData.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
      CREATE TABLE UserData
      (
        id INTEGER PRIMARY KEY,
        firstName TEXT,
        lastName TEXT,
        password TEXT,
        email TEXT,
        contact TEXT,
        gender TEXT,
        birthDate TEXT,
      ) 
      """);
    });
  }

  Future<RegisterModel> fetchUserData() async {
    final map = await db.query(
      'UserData',
      columns: null,
    );
    if (map.length > 0) {
      return RegisterModel.fromDb(map.first);
    }
    return null;
  }

  Future<int> addUser(RegisterModel registerModel) {
    return db.insert('UserData', registerModel.toMap());
  }

  Future<int> addUserData(RegisterModel registerModel) {
    return null;
  }
}
