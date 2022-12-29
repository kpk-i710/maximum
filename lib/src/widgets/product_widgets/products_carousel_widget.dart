import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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
            return 4!=4
                ? widgets.productPlaceholder(width: 180, height: 160)
                : ProductCarouselItemWidget(

                    width: Get.width / 2.8,
                  );
          },

          itemCount: 4,
          primary: false,
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,   separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        ),
      ),
    );
  }
}
