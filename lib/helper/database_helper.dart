import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:diary/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  // singleton to instantiate once throughout lifecyle
  static Database? _database;

  // static final NoteService _shared = NoteService._sharedInstance();
  // NoteService._sharedInstance() {
  //   _notesStreamController = StreamController<List<DatabaseNotes>>.broadcast(
  //     onListen: () {
  //       _notesStreamController.sink.add(_notes);
  //     },
  //   );
  // }

  //definig the tables and columns
  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); //Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  // creating a getter for our db
  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  //initialize database
  Future<Database> initializeDatabase() async {
    //get the directoty path for both Android and Ios to stor database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "$directory.path + 'note.db'";

    //open/create the db at given path
    var noteDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return noteDatabase;
  }

  //funtion create db
  void _createDb(Database db, int newVersion) async {
    await db.execute(
      ''' CREATE TABLE $noteTable(
    $colId	INTEGER NOT NULL UNIQUE,
    $colTitle	TEXT,
    $colDescription	TEXT,
    $colPriority	INTEGER,
    $colDate	TEXT,
    PRIMARY KEY($colId AUTOINCREMENT)
    );''',
    );
  }

  //Fetch Operation
  // Future<Database>fetchNotes()async{
  //   await rea
  // }
  getNoteMapList() async {
    Database db = await database;
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;

    //we will convert list of map to note
  }

  //Insert Operation
  Future<int> addNote(Note note) async {
    Database db = await database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  //Update  Operation
  Future<int> updateNote(Note note) async {
    var db = await database;
    var result = db.update(noteTable, note.toMap(),
        where: colId = '', whereArgs: [note.id]);
    return result;
  }

  //Delete  Operation
  Future<int> deleteNote(int id) async {
    var db = await database;
    var result = await db.delete(
      noteTable,
      where: colId = '$id',
    );
    return result;
  }

  //Get Number of Note object
  Future<int?> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (x) from $noteTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }
  //my version
  // Future<void> getTotalNote() async {
  //   var db = await database;
  //   var result = db.query(noteTable.length as String);
  //   return result;
  // }
}
