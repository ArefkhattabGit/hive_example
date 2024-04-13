import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_example_flutter/constant/constant.dart';
import 'package:hive_example_flutter/model/TSearch.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveHelper {
  late Box<TSearch> box;

  HiveHelper._init(this.box);

  static late final HiveHelper _instance;

  static HiveHelper get instance => _instance;

  static Future<void> init() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    final box = await Hive.openBox<TSearch>(Constant.searches_box);
    _instance = HiveHelper._init(box);
  }

  List<TSearch> getAllSearch() => box.values.toList();

  TSearch getSearch(int id) => box.get(id)!;

  void deleteSearch(int id) => box.deleteAt(id);

  void deleteAllSearch() => box.clear();

  Future<int> addSearch(TSearch tSearch) async => await box.add(tSearch);
}
