import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'profile_image.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ProfileImage(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            imagePath TEXT
          )
        ''');
      },
    );
  }

  // Insert or update image path
  static Future<void> saveImagePath(String imagePath) async {
    final db = await getDatabase();

    // If there is existing entry then updated here
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM ProfileImage'),
    );

    if (count == 0) {
      await db.insert('ProfileImage', {'imagePath': imagePath});
    } else {
      await db.update('ProfileImage', {'imagePath': imagePath},
          where: 'id = ?', whereArgs: [1]);
    }
  }

  // Retrieve image path
  static Future<String?> getImagePath() async {
    final db = await getDatabase();
    final result = await db.query('ProfileImage', limit: 1);
    if (result.isNotEmpty) {
      return result.first['imagePath'] as String?;
    }
    return null;
  }

  // Delete the image path
  static Future<void> deleteImagePath() async {
    final db = await getDatabase();
    await db.delete('ProfileImage');
  }
}
