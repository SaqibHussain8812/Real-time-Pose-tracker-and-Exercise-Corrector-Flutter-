import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserProfileDatabase {
  static final UserProfileDatabase _instance = UserProfileDatabase._internal();
  factory UserProfileDatabase() => _instance;

  UserProfileDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initialize the database
  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'user_profile.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE user_profile (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            gender TEXT,
            age TEXT,
            height TEXT,
            weight REAL,
            activity_level TEXT
          )
        ''');
      },
    );
  }

  /// Save user profile to the database
  Future<void> saveUserProfile({
    required String gender,
    required String age,
    required String height,
    required double weight,
    required String activityLevel,
  }) async {
    final db = await database;

    // Delete any existing data to ensure only one profile is stored
    await db.delete('user_profile');

    print(
        "Saving to database: $gender, $age, $height, $weight, $activityLevel");
    await db.insert(
      'user_profile',
      {
        'gender': gender,
        'age': age,
        'height': height,
        'weight': weight,
        'activity_level': activityLevel,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Load user profile from the database
  Future<Map<String, dynamic>?> loadUserProfile() async {
    final db = await database;
    final result = await db.query('user_profile', limit: 1);
    if (result.isNotEmpty) {
      print("Loaded from database: ${result.first}");
      return result.first;
    }
    print("No data found in the database.");
    return null;
  }
}
