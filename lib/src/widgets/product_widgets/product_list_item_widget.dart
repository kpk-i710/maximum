import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../styles.dart';
import '../../models/product.dart';
import '../../widgets/cart_widgets/cart_with_text_button.dart';
import '../../widgets/widgets.dart' as widgets;

class ProductListItemWidget extends StatelessWidget {
  final double height;

  const ProductListItemWidget({Key? key, this.height = 240}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffD9D9D9).withOpacity(0.6),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  height: 180,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://max.kg/nal/img/1051/b_tov_11270015_7e11f3ef.jpg",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    context.theme.primary),
                                value: progress.totalSize != null
                                    ? progress.downloaded / progress.totalSize!
                                    : null);
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.8, 0.8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTextStyles.colorBlueMy,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          child: Text(
                            'ХИТ',
                            style: AppTextStyles.robotoCondensed(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.0,  0.8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff991A4E),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          child: Text(
                            '- 40%',
                            style: AppTextStyles.robotoCondensed(
                                color: context.theme.onAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    widgets.titleDescrpPriceWithoutCar(
                      price: "1 000с",
                      title: "Мультиварка Redmond RMC-M36",
                      oldPrice: "1 200c",
                    ),
                    Spacer(),
                    widgets.addCardAndFavoriteAndCar(
                        textCard: 'to_cart'.tr,
                        onPressedCard: () {},
                        isSelectedFavorite: false),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
