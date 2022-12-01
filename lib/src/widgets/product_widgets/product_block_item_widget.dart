import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../styles.dart';
import '../../widgets/cart_widgets/cart_with_text_button.dart';
import '../../models/product.dart';
import '../../widgets/widgets.dart' as widgets;

class ProductBlockItemWidget extends StatelessWidget {
  final String heroTag;
  final Product? product;
  final double? width;

  const ProductBlockItemWidget(
      {Key? key, this.product, this.heroTag = 'product_block_', this.width})
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = this.product!;
    return InkWell(
      onTap: () {
        product.heroTag = heroTag;
        Get.toNamed('/product_details', arguments: product);
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        margin: const EdgeInsets.only(left: 1.5, right: 1.5, bottom: 4),
        child: Container(
          padding: const EdgeInsets.only(right: 5, left: 5, top: 30),
          height: 520,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 60,
                child: Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CachedNetworkImage(
                          imageUrl: product.imageUrl,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.all(32),
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        context.theme.focus),
                                    value: progress.totalSize != null
                                        ? progress.downloaded /
                                            progress.totalSize!
                                        : null),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                '- 50%',
                                style: AppTextStyles.mPlusRounded1c(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                'bestseller'.tr.toUpperCase(),
                                style: AppTextStyles.mPlusRounded1c(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgets.rating(4),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: Text(
                            product.name!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.mPlusRounded1c(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'code'.tr.toLowerCase() + ': 15667654',
                              style: AppTextStyles.mPlusRounded1c(
                                  color: context.theme.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: product.discountPrice != 0 ? 0 : 1.0,
                                  child: Text(
                                    product.getPriceWithCurrency(),
                                    style: AppTextStyles.mPlusRounded1c(
                                        fontSize: 12,
                                        decorationColor: context.theme.accent,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ),
                                Text(
                                  product.getCurrentPriceWithCurrency(),
                                  style: AppTextStyles.mPlusRounded1c(
                                      color: context.theme.accent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CartWithTextButtonWidget(product),
                                const SizedBox(width: 10),
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                        MaterialCommunityIcons.heart_outline,
                                        color: context.theme.grey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'на складе, доставим за 1-2 дня',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.mPlusRounded1c(
                              color: context.theme.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
