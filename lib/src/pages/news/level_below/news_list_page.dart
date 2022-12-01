import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../widgets/news_widgets/news_grid_item_widget.dart';
import '../../../widgets/search_widgets/search_bar_2.dart';
import 'news_list_page_controller.dart';
import 'level_below/page_news.dart';

class NewsListPage extends StatelessWidget {
  NewsListPage({Key? key}) : super(key: key);

  final newsListPageController = Get.put(NewsListPageController());
  final height = 180.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          SearchBar2(title: newsListPageController.newsList?.news.naim ?? ""),
      body: Obx(() {
        return Visibility(
          visible: newsListPageController.isLoaded.value,
          child: ListView.builder(
              itemCount: newsListPageController.newsList?.result[0][0].length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Html(
                    data: newsListPageController.newsList?.news.anons,
                  );
                }

                return NewsGridItemWidget(
                  onPress: () {
                    Get.to(
                        PageNews(
                          result: newsListPageController.newsList?.result[0][0]
                              [index],
                        ),
                        arguments: {
                          "title": newsListPageController
                              .newsList?.result[0][0][index].naim,
                        });
                  },
                  result: newsListPageController.newsList?.result[0][0][index],
                );
              }),
          replacement: Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }

  String? getImage(String? image) {
    print(image);
    return image;
  }
}
