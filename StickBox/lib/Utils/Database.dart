import 'package:StickBox/Models/Sticker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  //return database if exists, and if not, create one.
  Future<Database> get database async {
    if (database != null) {
      return database;
    }

    _database = await initDB();
    return _database;
  }

  //if database not exist, we create a new one.
  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'StickBox.db'),
        onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE  stickers(useremail TEXT, name TEXT, package TEXT)''');
    }, version: 1);
  }

  //Insert a new user into SQLite database.
  newuser(Sticker newSticker) async {
    final db = await database;

    var res = await db.rawInsert(
        '''INSERT INTO stickers (useremail, name, package) VALUES (?,?)''',
        [newSticker.useremail, newSticker.name, newSticker.package]);

    return res;
  }

  Future<dynamic> getUser() async {
    final db = await database;
    var res = await db.query('stickers');

    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : null;
    }
  }
}
