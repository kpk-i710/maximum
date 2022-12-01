import 'package:flutter/material.dart';

import '../../widgets/product_widgets/product_carousel_item_widget.dart';
import '../../models/product.dart';
import '../../widgets/widgets.dart' as widgets;

class ProductsCarouselWidget extends StatelessWidget {
  final List<Product> list;


  ProductsCarouselWidget({Key? key, required this.list })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 250),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: (index == 0) ? 12 : 0, // first element left padding 12
                  right: (index == list.length - 1)
                      ? 12
                      : 10), // last element right padding 12
              child: list.isEmpty
                  ? widgets.productPlaceholder(width: 180, height: 160)
                  : ProductCarouselItemWidget(

                      product: list.elementAt(index),
                      width: 180,
                    ),
            );
          },
          itemCount: list.isEmpty ? 4 : list.length,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
