import 'package:carde/database/CardInfo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:carde/database/UserInfo.dart';
import 'package:path/path.dart';

class CardDatabase {
  static final CardDatabase instance = CardDatabase._init();
  static Database? _database;
  CardDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('card.db');
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
    await db.execute(
      '''
      CREATE TABLE $cardInfoTable(
        ${CardInfoFields.id} $idType,
        ${CardInfoFields.name} $textType,
        ${CardInfoFields.number} $textType,
        ${CardInfoFields.email} $textType,
        ${CardInfoFields.bio} $textType
      )''',
    );

    await db.execute('''
      CREATE TABLE $userInfoTable(
        ${UserInfoFields.id} $idType,
        ${UserInfoFields.loginUsername} $textType,
        ${UserInfoFields.loginEmail} $textType,
        ${UserInfoFields.loginPassword} $textType
      )''');

    // TODO: CREATE TABLE FOR CARD COLLECTION
  }

  // CRUD OPERATIONS FOR CARDINFO
  Future<CardInfo> create(CardInfo card) async {
    final db = await instance.database;
    final id = await db.insert(cardInfoTable, card.toJson());
    return card.copy(id: id);
  }

  Future<CardInfo?> readNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      cardInfoTable,
      columns: CardInfoFields.values,
      where: '${CardInfoFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return CardInfo.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<CardInfo>> readAllCards() async {
    final db = await instance.database;
    final orderBy = '${CardInfoFields.id} ASC';
    final result = await db.query(cardInfoTable, orderBy: orderBy);
    return result.map((json) => CardInfo.fromJson(json)).toList();
  }

  Future<int> update(CardInfo card) async {
    final db = await instance.database;
    return db.update(cardInfoTable, card.toJson(),
        where: '${CardInfoFields.id} = ?', whereArgs: [card.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(cardInfoTable,
        where: '${CardInfoFields.id}=?', whereArgs: [id]);
  }

  // TODO: CRUD OPERATIONS FOR USERINFO

  // TODO: CRUD OPERATIONS FOR CARDCOLLECTION

  // CLOSE
  Future close() async {
    final db = await instance.database;
    db.close;
  }
}
