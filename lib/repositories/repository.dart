import 'package:saku_dompet/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    //initialize  database connection
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  //check database exist
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  // insert data to database
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  // read data from database
  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }

  // read data tabel by id
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection.query(table, where: 'id=?', whereArgs: [itemId]);
  }
}
