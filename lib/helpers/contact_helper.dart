import 'dart:async';
import 'package:pageview_carrousel/constants/service_constants.dart';
import 'package:pageview_carrousel/models/contact_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contactsnew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE ${UserColumn().contactTable}"
          "(${UserColumn().idColumn} INTEGER PRIMARY KEY,"
          " ${UserColumn().nameColumn} TEXT,"
          " ${UserColumn().emailColumn} TEXT,"
          "${UserColumn().phoneColumn}TEXT,"
          "${UserColumn().cepColumn}TEXT,"
          "${UserColumn().streetColumn}TEXT,"
          "${UserColumn().nameColumn}TEXT,"
          "${UserColumn().complementColumn}TEXT,"
          "${UserColumn().cityColumn}TEXT,"
         "${UserColumn().stateColumn}TEXT,");
    });
  }

  Future<Contact> saveContact(Contact contact) async {
    Database? dbContact = await (db);
    contact.id = await dbContact!.insert(
        UserColumn().contactTable,
        contact.toMap());
    return contact;
  }

  Future<Contact?> getContact(int id) async {
    Database? dbContact = await (db);
    List<Map> maps = await dbContact!.query(UserColumn().contactTable,
        columns: [
          UserColumn().idColumn,
          UserColumn().nameColumn,
          UserColumn().emailColumn,
          UserColumn().phoneColumn,
          UserColumn().cepColumn,
          UserColumn().streetColumn,
          UserColumn().nameColumn,
          UserColumn().complementColumn,
          UserColumn().cityColumn,
          UserColumn().stateColumn ,
        ],
        where: "${UserColumn().idColumn} = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int? id) async {
    Database? dbContact = await (db);
    return await dbContact!.delete(
      UserColumn().contactTable,
      where: "${UserColumn().idColumn} = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateContact(Contact contact) async {
    Database? dbContact = await (db);
    return await dbContact!.update(
        UserColumn().contactTable, contact.toMap() as Map<String, Object?>,
        where: "${UserColumn().idColumn} = ?", whereArgs: [contact.id]);
  }

  Future<List<Contact>> getAllContacts() async {
    Database? dbContact = await (db);
    String sql;
    sql = ("SELECT * FROM ${UserColumn().contactTable}");

    var result = await dbContact?.rawQuery(sql);

    List<Contact> list = result!.map((item) {
      return Contact.fromMap(item);
    }).toList();

    return list;
  }

  Future<int?> getNumber() async {
    Database? dbContact = await (db);
    return Sqflite.firstIntValue(await dbContact!
        .rawQuery("SELECT COUNT(*) FROM ${UserColumn().contactTable}"));
  }

  Future close() async {
    Database? dbContact = await (db);
    dbContact!.close();
  }
}
