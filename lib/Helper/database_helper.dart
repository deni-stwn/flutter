import 'package:e_letter/Model/activity/activity_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('activities.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableActivity ( 
      ${ActivityFields.id} $idType, 

      ${ActivityFields.title} $textType,
      ${ActivityFields.date} $textType
      )
    ''');
  }

  Future<ActivityModel> create(ActivityModel activity) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableActivity, activity.toJson());
    return activity.copy(id: id);
  }

  Future<ActivityModel> readActivity(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableActivity,
      columns: ActivityFields.values,
      where: '${ActivityFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ActivityModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<ActivityModel>> readAllActivity() async {
    final db = await instance.database;

    final orderBy = '${ActivityFields.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableActivityModels ORDER BY $orderBy');

    final result = await db.query(tableActivity, orderBy: orderBy);

    return result.map((json) => ActivityModel.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
  // static DatabaseHelper? _databaseHelper;
  // static late Database _database;
  // DatabaseHelper._internal() {
  //   _databaseHelper = this;
  // }
  // factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  // Future<Database> get database async {
  //   _database = await _initialDb();
  //   return database;
  // }

  // final String _tableName = 'activity';
  // Future<Database> _initialDb() async {
  //   var db = openDatabase(
  //     join(await getDatabasesPath(), 'activity_db.db'),
  //     onCreate: ((db, version) async {
  //       await db.execute(
  //         '''CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, date TEXT)''',
  //       );
  //     }),
  //     version: 1,
  //   );
  //   return db;
  // }

  // Future<void> insertActivity(ActivityModel activityModel) async {
  //   final Database db = await database;
  //   await db.insert(_tableName, activityModel.toMap());
  // }

  // Future<List<ActivityModel>> getActivity() async {
  //   final Database db = await database;
  //   List<Map<String, dynamic>> results = await db.query(_tableName);
  //   return results.map((e) => ActivityModel.fromMap(e)).toList();
  // }

