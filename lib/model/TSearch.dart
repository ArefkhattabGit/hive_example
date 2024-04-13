import 'package:hive/hive.dart';
part 'TSearch.g.dart';

@HiveType(typeId: 0)
class TSearch {
  @HiveField(0)
  final String title;
  @HiveField(1)
  int id;

  static int _lastId = 0;

  TSearch({required this.title}) : id = ++_lastId;


 }
