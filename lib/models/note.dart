//creating the model class

//notes table
// import 'dart:ffi';

class Note {
  // insert the columns of the table
  late final int _id;
  late final String _title;
  late final String? _description;
  late final String _date;
  late final int _priority;

  Note(this._title, this._date, this._priority, this._id, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  //creating getter for them
  int get id => _id;
  String get title => _title;
  String? get description => _description;
  String get date => _date;
  int get priority => _priority;

  //Creating Setter for them
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String? newDescription) {
    if (newDescription!.length <= 1000) {
      newDescription = _description;
    }
  }

  set date(String newDate) {
    _description = newDate;
  }

  set priority(int newPriority) {
    if ((newPriority >= 1) && (newPriority <= 3)) {
      newPriority = _priority;
    }
  }

  // function to convert to note obj and vice versa

  //Convert Note obj to Map obj
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{}; //in literal
    //checking id if null
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;
    return map;
  }

  //Extract Map obj into Note obj
  Note.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _description = map['description'];
    _priority = map['priority'];
    _date = map['date'];
  }
}
