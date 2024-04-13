import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_example_flutter/model/TSearch.dart';
import 'package:hive_example_flutter/module/search/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final controller = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                controller.deleteAllSearch();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete),
              ))
        ],
        title: const Text('Search Screen Example'),
      ),
      body: Obx(
        () => _buildSearchListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSearchDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView _buildSearchListWidget() {
    return ListView.builder(
      itemCount: controller.searches.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(controller.searches[index].title),
        leading: InkWell(
          onTap: () => controller.deleteSearch(index),
          child: const Icon(Icons.close),
        ),
      ),
    );
  }

  Future<void> _showAddSearchDialog() async {
    return showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: const Text('Add Search'),
        content: TextField(
          controller: controller.searchController,
          decoration: const InputDecoration(
            labelText: 'Search Query',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller
                  .addSearch(TSearch(title: controller.searchController.text));
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
