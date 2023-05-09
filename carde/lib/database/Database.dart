import 'package:carde/database/CardInfo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:carde/database/UserInfo.dart';
import 'package:carde/database/CardCollection.dart';
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
    final listType = 'TEXT';
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

    await db.execute('''
      CREATE TABLE $cardCollectionTable(
        ${CardCollectionFields.id} $idType,
        ${CardCollectionFields.cardList} $listType
      )''');
  }

  // CRUD OPERATIONS FOR CARDINFO
  Future<CardInfo> createCardInfo(CardInfo card) async {
    final db = await instance.database;
    final id = await db.insert(cardInfoTable, card.toJson());
    return card.copy(id: id);
  }

  Future<CardInfo?> readCardInfo(int id) async {
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

  Future<int> updateCardInfo(CardInfo card) async {
    final db = await instance.database;
    return db.update(cardInfoTable, card.toJson(),
        where: '${CardInfoFields.id} = ?', whereArgs: [card.id]);
  }

  Future<int> deleteCardInfo(int id) async {
    final db = await instance.database;
    return await db.delete(cardInfoTable,
        where: '${CardInfoFields.id}=?', whereArgs: [id]);
  }

  // CRUD OPERATIONS FOR USER INFO
  Future<UserInfo> createUserInfo(UserInfo user) async {
    final db = await instance.database;
    final id = await db.insert(userInfoTable, user.toJson());
    return user.copy(id: id);
  }

  Future<UserInfo?> readUserInfo(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      userInfoTable,
      columns: UserInfoFields.values,
      where: '${UserInfoFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return UserInfo.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<UserInfo>> readAllUsers() async {
    final db = await instance.database;
    final orderBy = '${UserInfoFields.id} ASC';
    final result = await db.query(userInfoTable, orderBy: orderBy);
    return result.map((json) => UserInfo.fromJson(json)).toList();
  }

  Future<int> updateUserInfo(UserInfo user) async {
    final db = await instance.database;
    return db.update(userInfoTable, user.toJson(),
        where: '${UserInfoFields.id} = ?', whereArgs: [user.id]);
  }

  Future<int> deleteUserInfo(int id) async {
    final db = await instance.database;
    return await db.delete(userInfoTable,
        where: '${UserInfoFields.id}=?', whereArgs: [id]);
  }

// CRUD OPERATIONS FOR CARD COLLECTION
  Future<CardCollection> createCardCollection(CardCollection user) async {
    final db = await instance.database;
    final id = await db.insert(cardCollectionTable, user.toJson());
    return user.copy(id: id);
  }

  Future<CardCollection?> readCardCollection(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      cardCollectionTable,
      columns: CardCollectionFields.values,
      where: '${CardCollectionFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return CardCollection.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<CardCollection>> readAllCollections() async {
    final db = await instance.database;
    final orderBy = '${CardCollectionFields.id} ASC';
    final result = await db.query(cardCollectionTable, orderBy: orderBy);
    return result.map((json) => CardCollection.fromJson(json)).toList();
  }

  Future<int> updateCardCollection(CardCollection user) async {
    final db = await instance.database;
    return db.update(cardCollectionTable, user.toJson(),
        where: '${CardCollectionFields.id} = ?', whereArgs: [user.id]);
  }

  Future<int> deleteCardCollection(int id) async {
    final db = await instance.database;
    return await db.delete(cardCollectionTable,
        where: '${CardCollectionFields.id}=?', whereArgs: [id]);
  }

  // CLOSE
  Future close() async {
    final db = await instance.database;
    db.close;
  }
}
