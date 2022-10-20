import 'package:surabaya_in_your_hand/model/wisata.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  final String tableName = 'tableJudul';
  final String columnId = 'id';
  final String columnNamaWisata = 'namawisata';
  final String columnJamBuka = 'jambuka';
  final String columnTelpon = 'telpon';
  final String columnAlamat = 'alamat';

  DBHelper._internal();
  factory DBHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Wisata_db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,"
        "$columnNamaWisata TEXT,"
        "$columnJamBuka TEXT,"
        "$columnTelpon TEXT,"
        "$columnAlamat TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveWisata(Wisata wisata) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, wisata.toMap());
  }

  Future<List?> getAllWisata() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnNamaWisata,
      columnJamBuka,
      columnTelpon,
      columnAlamat
    ]);
    return result.toList();
  }

  Future<int?> updateWisata(Wisata wisata) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, wisata.toMap(),
        where: '$columnId = ?', whereArgs: [wisata.id]);
  }

  Future<int?> deleteWisata(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
