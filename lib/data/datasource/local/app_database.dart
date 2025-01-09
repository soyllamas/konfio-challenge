import 'dart:async';

import 'package:floor/floor.dart';
import 'package:konfio_challenge/data/datasource/local/dog_dao.dart';
import 'package:konfio_challenge/data/datasource/local/dog_local_dto.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [DogLocalDto])
abstract class AppDatabase extends FloorDatabase {
  DogDao get dogDao;
}
