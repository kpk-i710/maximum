import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../styles.dart';
import '../../models/product.dart';
import '../../widgets/cart_widgets/cart_with_text_button.dart';
import '../../widgets/widgets.dart' as widgets;

class ProductListItemWidget extends StatelessWidget {

  final Product? product;
  final double height;

  const ProductListItemWidget(
      {Key? key, this.product, this.height = 240})
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       
        Get.toNamed('/product_details', arguments: product);
      },
      child: Container(
        color: Colors.grey.shade200,
        child: Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 4),
          color: Get.theme.background,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200, width: 0.5)),
            child: Row(
              children: [
                Expanded(
                  flex: 40,
                  child: Container(
                    height: height,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl: product!.imageUrl,
                              fit: BoxFit.contain,
                              progressIndicatorBuilder:
                                  (context, url, progress) {
                                return Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(32),
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                context.theme.accent),
                                        value: progress.totalSize != null
                                            ? progress.downloaded /
                                                progress.totalSize!
                                            : null),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Flexible(
                          flex: 1,
                          child: Text(
                            'Доставим в течении 15 дней',
                            style: AppTextStyles.mPlusRounded1c(
                                color: context.theme.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 60,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              widgets.rating(4),
                              SizedBox(height: 5),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  product!.name!,
                                  maxLines: 3,
                                  style: AppTextStyles.mPlusRounded1c(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      product!.discountPrice != 0
                                          ? Row(
                                              children: <Widget>[
                                                Text(
                                                  product!
                                                      .getPriceWithCurrency(),
                                                  style: AppTextStyles
                                                      .mPlusRounded1c(
                                                          fontSize: 12,
                                                          color: context
                                                              .theme.secondary
                                                              .withOpacity(0.5),
                                                          decorationColor:
                                                              context
                                                                  .theme.accent,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      Text(
                                        product!.getCurrentPriceWithCurrency(),
                                        style: AppTextStyles.mPlusRounded1c(
                                            color: context.theme.accent,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'code'.tr + ' 1254261',
                                    style: AppTextStyles.mPlusRounded1c(
                                        color: context.theme.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  CartWithTextButtonWidget(product!),
                                  SizedBox(width: 10),
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
                              )
                            ]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
