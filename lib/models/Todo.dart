class Todo {

  static const String TABLE = 'Todo';
  static const String COL_ID = 'Id';
  static const String COL_TITLE = 'Title';
  static const String COL_DATE = 'DateTime';

  // Structure
  int? _id;
  String? _title;
  String? _dateTime;

  // Constructor
  Todo(
    this._title,
    this._dateTime,
  );

  // Getters
  int? get id => _id;
  String? get title => _title;
  String? get dateTime => _dateTime;

  // Setters
  set title(String? title) => {_title = title};
  set dateTime(String? dateTime) => {_dateTime = _dateTime};

  // Map
  Todo.fromMap(dynamic obj) {
    _id = obj[COL_ID];
    _title = obj[COL_TITLE];
    _dateTime = obj[COL_DATE];
  }

  Map<String, dynamic> toMap() {
    return {
      COL_ID: _id,
      COL_TITLE: _title,
      COL_DATE: _dateTime,
    };
  }

}
