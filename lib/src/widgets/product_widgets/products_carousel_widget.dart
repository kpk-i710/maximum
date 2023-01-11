import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:maxkgapp/src/widgets/bought_today/bought_today_item_black_widget.dart';

import '../../widgets/product_widgets/product_carousel_item_widget.dart';
import '../../models/product.dart';
import '../../widgets/widgets.dart' as widgets;

class ProductsCarouselWidget extends StatelessWidget {
  final List<Product> list;

  ProductsCarouselWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 240),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return BoughtTodayItemBlackWidget(

            );
          },

          itemCount: 4,
          primary: false,
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 0,
          ),
        ),
      ),
    );
  }
}
