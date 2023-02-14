import 'package:drift/drift.dart';

class Schedules extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get content => text()();

  DateTimeColumn get date => dateTime()();

  IntColumn get startTime => integer()();

  IntColumn get endTime => integer()();

  IntColumn get colorID => integer()();

  //입력하는 순간이므로 now()를 쓰면 됨. 또한, 다른 date값을 입력하면 그 값으로 반영이됨
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();
}
