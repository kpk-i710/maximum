import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../styles.dart';
import '../../models/product.dart';
import '../../widgets/app_icon.dart';

class ProductImagesCarouselWithIndicator extends StatelessWidget {
  final Product product;
  final double height;

  ProductImagesCarouselWithIndicator(this.product, {this.height = 300});

  final _current = 0.obs;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 10;
    return product.image != null
        ? Material(
          child: InkWell(
              onTap: () {},
              child: Container(
                height: height,
                child: Stack(children: [
                  Column(
                    children: [
                      Container(
                        height: height - 30,
                        child: Swiper(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int itemIndex) {
                            return Container(
                              width: width,
                              color: context.theme.background.withAlpha(50),
                              child: CachedNetworkImage(
                                imageUrl: '${product.imageUrl}',
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                          onIndexChanged: (int index) {
                            _current.value = index;
                          },
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() => Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _current.value == 0
                                          ? context.theme.primary
                                          : context.theme.grey,
                                    ),
                                  ))
                            ]),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5,
                    right: 15,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Container(
                        height: 55,
                        width: 55,
                        child: IconButton(
                            iconSize: 32,
                            icon: AppIcon(AppIcons.youtube,
                                color: context.theme.accent, size: 32),
                            onPressed: () {}),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 10,
                    child: Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            '- 50%',
                            style: AppTextStyles.mPlusRounded1c(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            'hit'.tr.toUpperCase(),
                            style: AppTextStyles.mPlusRounded1c(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
        )
        : SizedBox(height: 200);
  }
}
