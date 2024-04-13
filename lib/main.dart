import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example_flutter/helper/hive_helper.dart';
import 'package:hive_example_flutter/model/TSearch.dart';
import 'package:hive_example_flutter/module/search/search_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:get/get.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TSearchAdapter());
  await HiveHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive example',
      home: SearchScreen(),
    );
  }
}
