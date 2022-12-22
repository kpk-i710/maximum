import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:maxkgapp/src/models/category.dart';
import 'package:maxkgapp/src/pages/popular_category/popular_category_controller.dart';
import '../../widgets/widgets.dart' as widgets;

class popular_categories_item extends StatelessWidget {
  final index;

  const popular_categories_item({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PopularCategoryController());

    return widgets.boxShadows(
      padding: 0,
      child: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
              width: Get.width / 5,
              height: 80,
              child: Image.asset(
                  "assets/images/${controller.listData[index].image}")),
          SizedBox(height: 20),
          Text(
            " ${controller.listData[index].title}",
            style: widgets.robotoConsid(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
