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

  SettingDao? _settingDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `LoginData` (`loginBy` INTEGER NOT NULL, `uniqueId` TEXT NOT NULL, `userId` TEXT NOT NULL, `password` TEXT NOT NULL, PRIMARY KEY (`uniqueId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TeacherData` (`teacherId` TEXT NOT NULL, `teacherName` TEXT NOT NULL, `dob` INTEGER NOT NULL, `address` TEXT NOT NULL, `exprience` TEXT NOT NULL, `dateOfJoing` TEXT NOT NULL, `periodId` TEXT NOT NULL, PRIMARY KEY (`teacherId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `StudentData` (`studentId` TEXT NOT NULL, `studentFirstName` TEXT NOT NULL, `studentLastName` TEXT NOT NULL, `gender` TEXT NOT NULL, `cgpa` INTEGER NOT NULL, `classId` TEXT NOT NULL, `dob` INTEGER NOT NULL, `aadharNumber` INTEGER NOT NULL, `address` TEXT NOT NULL, `subCast` TEXT NOT NULL, `religion` TEXT NOT NULL, `marksObtain` REAL NOT NULL, `attendsObtain` INTEGER NOT NULL, `joinIn` INTEGER NOT NULL, `fatherFirstName` TEXT NOT NULL, `fatherLastName` TEXT NOT NULL, `motherFirstName` TEXT NOT NULL, `motherLastName` TEXT NOT NULL, `gardiuanNumber` TEXT NOT NULL, `password` TEXT NOT NULL, PRIMARY KEY (`studentId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SettingData` (`id` INTEGER NOT NULL, `isOnline` INTEGER NOT NULL, PRIMARY KEY (`id`))');

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

  @override
  SettingDao get settingDao {
    return _settingDaoInstance ??= _$SettingDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentDataInsertionAdapter = InsertionAdapter(
            database,
            'StudentData',
            (StudentData item) => <String, Object?>{
                  'studentId': item.studentId,
                  'studentFirstName': item.studentFirstName,
                  'studentLastName': item.studentLastName,
                  'gender': item.gender,
                  'cgpa': item.cgpa,
                  'classId': item.classId,
                  'dob': item.dob,
                  'aadharNumber': item.aadharNumber,
                  'address': item.address,
                  'subCast': item.subCast,
                  'religion': item.religion,
                  'marksObtain': item.marksObtain,
                  'attendsObtain': item.attendsObtain,
                  'joinIn': item.joinIn,
                  'fatherFirstName': item.fatherFirstName,
                  'fatherLastName': item.fatherLastName,
                  'motherFirstName': item.motherFirstName,
                  'motherLastName': item.motherLastName,
                  'gardiuanNumber': item.gardiuanNumber,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StudentData> _studentDataInsertionAdapter;

  @override
  Future<List<StudentData>> findAllStudent() async {
    return _queryAdapter.queryList('Select * from Student',
        mapper: (Map<String, Object?> row) => StudentData(
            studentFirstName: row['studentFirstName'] as String,
            studentLastName: row['studentLastName'] as String,
            dob: row['dob'] as int,
            cgpa: row['cgpa'] as int,
            aadharNumber: row['aadharNumber'] as int,
            address: row['address'] as String,
            marksObtain: row['marksObtain'] as double,
            attendsObtain: row['attendsObtain'] as int,
            joinIn: row['joinIn'] as int,
            fatherFirstName: row['fatherFirstName'] as String,
            fatherLastName: row['fatherLastName'] as String,
            motherFirstName: row['motherFirstName'] as String,
            motherLastName: row['motherLastName'] as String,
            gardiuanNumber: row['gardiuanNumber'] as String,
            classId: row['classId'] as String,
            gender: row['gender'] as String,
            subCast: row['subCast'] as String,
            religion: row['religion'] as String,
            studentId: row['studentId'] as String,
            password: row['password'] as String));
  }

  @override
  Future<StudentData?> findStudentById(String id) async {
    return _queryAdapter.query('Select * from Student Where studentId = ?1',
        mapper: (Map<String, Object?> row) => StudentData(
            studentFirstName: row['studentFirstName'] as String,
            studentLastName: row['studentLastName'] as String,
            dob: row['dob'] as int,
            cgpa: row['cgpa'] as int,
            aadharNumber: row['aadharNumber'] as int,
            address: row['address'] as String,
            marksObtain: row['marksObtain'] as double,
            attendsObtain: row['attendsObtain'] as int,
            joinIn: row['joinIn'] as int,
            fatherFirstName: row['fatherFirstName'] as String,
            fatherLastName: row['fatherLastName'] as String,
            motherFirstName: row['motherFirstName'] as String,
            motherLastName: row['motherLastName'] as String,
            gardiuanNumber: row['gardiuanNumber'] as String,
            classId: row['classId'] as String,
            gender: row['gender'] as String,
            subCast: row['subCast'] as String,
            religion: row['religion'] as String,
            studentId: row['studentId'] as String,
            password: row['password'] as String));
  }

  @override
  Future<void> insertStudent(StudentData student) async {
    await _studentDataInsertionAdapter.insert(
        student, OnConflictStrategy.abort);
  }
}

class _$TeacherDao extends TeacherDao {
  _$TeacherDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _teacherDataInsertionAdapter = InsertionAdapter(
            database,
            'TeacherData',
            (TeacherData item) => <String, Object?>{
                  'teacherId': item.teacherId,
                  'teacherName': item.teacherName,
                  'dob': item.dob,
                  'address': item.address,
                  'exprience': item.exprience,
                  'dateOfJoing': item.dateOfJoing,
                  'periodId': item.periodId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TeacherData> _teacherDataInsertionAdapter;

  @override
  Future<List<TeacherData>> findAllTeacher() async {
    return _queryAdapter.queryList('Select * from Student',
        mapper: (Map<String, Object?> row) => TeacherData(
            row['teacherName'] as String,
            row['dob'] as int,
            row['address'] as String,
            row['exprience'] as String,
            row['dateOfJoing'] as String,
            row['periodId'] as String,
            teacherId: row['teacherId'] as String));
  }

  @override
  Future<TeacherData?> findTeacherById(String id) async {
    return _queryAdapter.query('Select * from Student Where studentId = ?1',
        mapper: (Map<String, Object?> row) => TeacherData(
            row['teacherName'] as String,
            row['dob'] as int,
            row['address'] as String,
            row['exprience'] as String,
            row['dateOfJoing'] as String,
            row['periodId'] as String,
            teacherId: row['teacherId'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertTeacher(TeacherData teacher) {
    return _teacherDataInsertionAdapter.insertAndReturnId(
        teacher, OnConflictStrategy.abort);
  }
}

class _$LoginDao extends LoginDao {
  _$LoginDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _loginDataInsertionAdapter = InsertionAdapter(
            database,
            'LoginData',
            (LoginData item) => <String, Object?>{
                  'loginBy': item.loginBy,
                  'uniqueId': item.uniqueId,
                  'userId': item.userId,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LoginData> _loginDataInsertionAdapter;

  @override
  Future<List<LoginData?>> findAllUser() async {
    return _queryAdapter.queryList('Select * from Student;',
        mapper: (Map<String, Object?> row) => LoginData(
            uniqueId: row['uniqueId'] as String,
            loginBy: row['loginBy'] as int,
            userId: row['userId'] as String,
            password: row['password'] as String));
  }

  @override
  Future<int?> getCount() async {
    await _queryAdapter.queryNoReturn('Select COUNT(*) from Student;');
  }

  @override
  Future<List<LoginData?>> findUser(
    String userId,
    String password,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE userId = ?1 AND password = ?2;',
        mapper: (Map<String, Object?> row) => LoginData(
            uniqueId: row['uniqueId'] as String,
            loginBy: row['loginBy'] as int,
            userId: row['userId'] as String,
            password: row['password'] as String),
        arguments: [userId, password]);
  }

  @override
  Future<int> insertUser(LoginData user) {
    return _loginDataInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }
}

class _$SettingDao extends SettingDao {
  _$SettingDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _settingDataInsertionAdapter = InsertionAdapter(
            database,
            'SettingData',
            (SettingData item) => <String, Object?>{
                  'id': item.id,
                  'isOnline': item.isOnline ? 1 : 0
                }),
        _settingDataUpdateAdapter = UpdateAdapter(
            database,
            'SettingData',
            ['id'],
            (SettingData item) => <String, Object?>{
                  'id': item.id,
                  'isOnline': item.isOnline ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SettingData> _settingDataInsertionAdapter;

  final UpdateAdapter<SettingData> _settingDataUpdateAdapter;

  @override
  Future<List<SettingData>> getAllSettings() async {
    return _queryAdapter.queryList('Select * from Setting',
        mapper: (Map<String, Object?> row) =>
            SettingData((row['isOnline'] as int) != 0, row['id'] as int));
  }

  @override
  Future<void> insertSetting(SettingData setting) async {
    await _settingDataInsertionAdapter.insert(
        setting, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateSetting(SettingData setting) {
    return _settingDataUpdateAdapter.updateAndReturnChangedRows(
        setting, OnConflictStrategy.abort);
  }
}
