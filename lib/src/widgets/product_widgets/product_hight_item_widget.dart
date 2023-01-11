import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:maxkgapp/src/widgets/discount_widgets/discount_swipe_widget_offline.dart';
import 'package:maxkgapp/src/widgets/widgets.dart';
import '../../widgets/widgets.dart' as widgets;

class ProductBlockItemWidget extends StatelessWidget {
  final double? width;

  const ProductBlockItemWidget({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: widgets.boxShadows(
          child: Column(
        children: [
          SwiperImage(
            image: 'assets/images/notebook_item.png',
          ),
          SizedBox(height: 10),
          Text(
            "Менделейка / Набор для опытов 6шт /Детский набор ",
            style: widgets.robotoConsid(),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widgets.truckSvg(),
              SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Text(
                  "Под заказ, доставим в Бишкек 24 - 31 октября",
                  style: widgets.robotoConsid(fontSize: 10),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 4,
                child: widgets.addCardAndFavorite(
                    rightPadding: 0,
                    textCard: 'to_cart'.tr,
                    onPressedCard: () {},
                    context: context),
              ),
            ],
          )
        ],
      )),
    );
  }
}
