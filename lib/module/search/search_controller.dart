import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_example_flutter/helper/hive_helper.dart';
import 'package:hive_example_flutter/model/TSearch.dart';

class SearchScreenController extends GetxController {

  final RxList<TSearch> searches = <TSearch>[].obs;
  late TextEditingController searchController;

  @override
  void onInit() {
    searchController = TextEditingController();
    _fetchSearchData();
    super.onInit();
  }

  void _fetchSearchData() => searches.value = HiveHelper.instance.getAllSearch();

  void addSearch(TSearch search) {
    HiveHelper.instance.addSearch(search);
    _fetchSearchData();
  }

  void deleteSearch(int id) {
    HiveHelper.instance.deleteSearch(id);
    _fetchSearchData();
  }

  void deleteAllSearch() {
    HiveHelper.instance.deleteAllSearch();
    searches.clear();
  }
}
