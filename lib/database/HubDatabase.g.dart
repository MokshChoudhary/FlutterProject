// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HubDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorHubDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$HubDatabaseBuilder databaseBuilder(String name) =>
      _$HubDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$HubDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$HubDatabaseBuilder(null);
}

class _$HubDatabaseBuilder {
  _$HubDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$HubDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$HubDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<HubDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$HubDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$HubDatabase extends HubDatabase {
  _$HubDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDao? _studentDaoInstance;

  TeacherDao? _teacherDaoInstance;

  LoginDao? _loginDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Login` (`loginBy` INTEGER NOT NULL, `userId` TEXT NOT NULL, `password` TEXT NOT NULL, PRIMARY KEY (`loginBy`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Teacher` (`teacherId` TEXT NOT NULL, `teacherName` TEXT NOT NULL, `dob` INTEGER NOT NULL, `address` TEXT NOT NULL, `exprience` TEXT NOT NULL, `dateOfJoing` TEXT NOT NULL, PRIMARY KEY (`teacherId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Student` (`studentId` TEXT NOT NULL, `studentFirstName` TEXT NOT NULL, `studentLastName` TEXT NOT NULL, `gender` INTEGER NOT NULL, `cgpa` INTEGER NOT NULL, `classId` TEXT NOT NULL, `dob` INTEGER NOT NULL, `aadharNumber` INTEGER NOT NULL, `address` TEXT NOT NULL, `marksObtain` REAL NOT NULL, `attendsObtain` INTEGER NOT NULL, `joinIn` INTEGER NOT NULL, `fatherFirstName` TEXT NOT NULL, `fatherLastName` TEXT NOT NULL, `motherFirstName` TEXT NOT NULL, `motherLastName` TEXT NOT NULL, `gardiuanNumber` INTEGER NOT NULL, PRIMARY KEY (`studentId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }

  @override
  TeacherDao get teacherDao {
    return _teacherDaoInstance ??= _$TeacherDao(database, changeListener);
  }

  @override
  LoginDao get loginDao {
    return _loginDaoInstance ??= _$LoginDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'Student',
            (Student item) => <String, Object?>{
                  'studentId': item.studentId,
                  'studentFirstName': item.studentFirstName,
                  'studentLastName': item.studentLastName,
                  'gender': item.gender,
                  'cgpa': item.cgpa,
                  'classId': item.classId,
                  'dob': item.dob,
                  'aadharNumber': item.aadharNumber,
                  'address': item.address,
                  'marksObtain': item.marksObtain,
                  'attendsObtain': item.attendsObtain,
                  'joinIn': item.joinIn,
                  'fatherFirstName': item.fatherFirstName,
                  'fatherLastName': item.fatherLastName,
                  'motherFirstName': item.motherFirstName,
                  'motherLastName': item.motherLastName,
                  'gardiuanNumber': item.gardiuanNumber
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  @override
  Future<List<Student>> findAllStudent() async {
    return _queryAdapter.queryList('Select * from Student',
        mapper: (Map<String, Object?> row) => Student(
            row['studentFirstName'] as String,
            row['studentLastName'] as String,
            row['dob'] as int,
            row['cgpa'] as int,
            row['aadharNumber'] as int,
            row['address'] as String,
            row['marksObtain'] as double,
            row['attendsObtain'] as int,
            row['joinIn'] as int,
            row['fatherFirstName'] as String,
            row['fatherLastName'] as String,
            row['motherFirstName'] as String,
            row['motherLastName'] as String,
            row['gardiuanNumber'] as int,
            row['classId'] as String,
            row['gender'] as int,
            studentId: row['studentId'] as String));
  }

  @override
  Future<Student?> findStudentById(String id) async {
    return _queryAdapter.query('Select * from Student Where studentId = ?1',
        mapper: (Map<String, Object?> row) => Student(
            row['studentFirstName'] as String,
            row['studentLastName'] as String,
            row['dob'] as int,
            row['cgpa'] as int,
            row['aadharNumber'] as int,
            row['address'] as String,
            row['marksObtain'] as double,
            row['attendsObtain'] as int,
            row['joinIn'] as int,
            row['fatherFirstName'] as String,
            row['fatherLastName'] as String,
            row['motherFirstName'] as String,
            row['motherLastName'] as String,
            row['gardiuanNumber'] as int,
            row['classId'] as String,
            row['gender'] as int,
            studentId: row['studentId'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertStudent(Student student) async {
    await _studentInsertionAdapter.insert(student, OnConflictStrategy.abort);
  }
}

class _$TeacherDao extends TeacherDao {
  _$TeacherDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _teacherInsertionAdapter = InsertionAdapter(
            database,
            'Teacher',
            (Teacher item) => <String, Object?>{
                  'teacherId': item.teacherId,
                  'teacherName': item.teacherName,
                  'dob': item.dob,
                  'address': item.address,
                  'exprience': item.exprience,
                  'dateOfJoing': item.dateOfJoing
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Teacher> _teacherInsertionAdapter;

  @override
  Future<List<Teacher>> findAllTeacher() async {
    return _queryAdapter.queryList('Select * from Student',
        mapper: (Map<String, Object?> row) => Teacher(
            row['teacherName'] as String,
            row['dob'] as int,
            row['address'] as String,
            row['exprience'] as String,
            row['dateOfJoing'] as String,
            teacherId: row['teacherId'] as String));
  }

  @override
  Future<Teacher?> findTeacherById(String id) async {
    return _queryAdapter.query('Select * from Student Where studentId = ?1',
        mapper: (Map<String, Object?> row) => Teacher(
            row['teacherName'] as String,
            row['dob'] as int,
            row['address'] as String,
            row['exprience'] as String,
            row['dateOfJoing'] as String,
            teacherId: row['teacherId'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertTeacher(Teacher teacher) {
    return _teacherInsertionAdapter.insertAndReturnId(
        teacher, OnConflictStrategy.abort);
  }
}

class _$LoginDao extends LoginDao {
  _$LoginDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _loginInsertionAdapter = InsertionAdapter(
            database,
            'Login',
            (Login item) => <String, Object?>{
                  'loginBy': item.loginBy,
                  'userId': item.userId,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Login> _loginInsertionAdapter;

  @override
  Future<List<Login?>> findAllUser() async {
    return _queryAdapter.queryList('Select * from Student;',
        mapper: (Map<String, Object?> row) => Login(
            loginBy: row['loginBy'] as int,
            userId: row['userId'] as String,
            password: row['password'] as String));
  }

  @override
  Future<List<Login?>> findUser(
    String userId,
    String password,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE userId = ?1 AND password = ?2;',
        mapper: (Map<String, Object?> row) => Login(
            loginBy: row['loginBy'] as int,
            userId: row['userId'] as String,
            password: row['password'] as String),
        arguments: [userId, password]);
  }

  @override
  Future<int> insertUser(Login user) {
    return _loginInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }
}
