import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/pages/detail_all/detail_all.dart';
import 'package:maxkgapp/src/styles.dart';

import '../../widgets/discount_widgets/discount_detail_item_widget.dart';

import '../../pages/favorite/favorite_page_controller.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../widgets/search_widgets/search_bar_2.dart';

class FavoritePage extends StatelessWidget {
  final controller = Get.put(FavoritePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar2(title: "favorite".tr),
      body: SafeArea(
        child: Prefs.isAddedToFavorite
            ? ListView.separated(
                itemCount: controller.dicount_list?.product[0].length ?? 0,
                itemBuilder: (context, index) {
                  return DiscountDetailItemWidget(
                    onPress: () {
                      print(controller.dicount_list?.product[0][index].naim);
                      final product =
                          controller.dicount_list?.product[0][index];

                      Get.to(
                          () => DetailAll(
                                idPost: product?.idPost,
                                img: product?.img,
                                price: product?.price,
                                naim: product?.naim,
                              ),
                          arguments: {
                            "title":
                                controller.dicount_list?.product[0][index].naim,
                          });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              )
            : emptyFavorite(),
      ),
    );
  }

  Widget emptyFavorite() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: Get.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "В избранном пока ничего нет",
                    style: widgets.robotoConsid(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Добавляйте понравившиеся товары в избранное, чтобы посмотреть или купить их позже",
                    textAlign: TextAlign.center,
                    style: widgets.robotoConsid(),
                  ),
                  SizedBox(height: 15),
                  widgets.colorCustomButton(
                      color: AppTextStyles.colorRedMy,
                      width: Get.width,
                      height: 50,
                      child: Text(
                        "Посмотреть каталог",
                        style: widgets.robotoConsid(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {}),
                  SizedBox(height: 15),

                ],
              ),
            ),
          ),
          widgets.twoList()
        ],
      ),
    );
  }
}
