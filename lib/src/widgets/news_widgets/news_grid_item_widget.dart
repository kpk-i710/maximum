import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../models/news_list.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class NewsGridItemWidget extends StatelessWidget {
  NewsGridItemWidget(
      {Key? key, required this.result, required this.onPress, this.index})
      : super(key: key);
  VoidCallback onPress;
  Result? result;
  final index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(  horizontal: 10),
      child: GestureDetector(
        onTap: onPress,
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
                      CachedNetworkImage(
                        imageUrl:
                            "https://max.kg/nal/img/${result?.idPost}/b_${result?.img}",
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) {
                          return CircularProgressIndicator(
                              value: progress.totalSize != null
                                  ? progress.downloaded / progress.totalSize!
                                  : null);
                        },
                      ),
                      Align(
                        alignment: Alignment(-0.8, 0.6),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff991A4E),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          child: Text(
                            '- ${result?.discountPrc}%',
                            style: widgets.robotoConsid(
                                color: Colors.white,
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
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    widgets.titleDescrpPriceWithoutCar(
                      price: result?.cenaok.toString(),
                      title: result?.naim.toString(),
                      oldPrice: result?.oldPrice.toString(),
                    ),
                    Spacer(),
                    widgets.addCardAndFavoriteAndCar(
                        textCard: 'to_cart'.tr,
                        onPressedCard: () {},
                        isSelectedFavorite: index == 1 ? true : false),
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
