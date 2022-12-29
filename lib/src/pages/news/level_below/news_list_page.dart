import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../widgets/news_widgets/news_grid_item_widget.dart';
import '../../../widgets/search_widgets/search_bar_2.dart';
import 'news_list_page_controller.dart';
import '../../detail_all/detail_all.dart';
import '../../../widgets/widgets.dart' as widgets;

class NewsListPage extends StatelessWidget {
  NewsListPage({Key? key}) : super(key: key);

  final newsListPageController = Get.put(NewsListPageController());
  final height = 180.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          SearchBar2(title: newsListPageController.newsList?.news.naim ?? ""),
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: newsListPageController.tabSelect),
      body: Obx(() {
        return newsListPageController.isLoaded.value
            ? ListView.separated(
                itemCount:
                    newsListPageController.newsList?.result[0][0].length ?? 0,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Html(
                      data: newsListPageController.newsList?.news.anons,
                    );
                  }

                  return NewsGridItemWidget(
                    index: index,
                    onPress: () {
                      final product =
                          newsListPageController.newsList?.result[0][0][index];

                      Get.to(
                          () => DetailAll(
                                idPost: product?.idPost,
                                img: product?.img,
                                price: product?.price,
                                naim: product?.naim,
                              ),
                          arguments: {
                            "title": newsListPageController
                                .newsList?.result[0][0][index].naim,
                          });
                    },
                    result: newsListPageController.newsList?.result[0][0]
                        [index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }

  String? getImage(String? image) {
    print(image);
    return image;
  }
}
