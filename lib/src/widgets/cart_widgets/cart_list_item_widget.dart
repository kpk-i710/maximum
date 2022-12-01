import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/app_network_image.dart';
import '../../styles.dart';
import '../../models/cart.dart';
import '../../cart_controller.dart';

class CartListItemWidget extends StatelessWidget {
  final Cart cartItem;
  CartListItemWidget({required this.cartItem});

  final cart = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 130,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: AppNetworkImage(imageUrl: cartItem.imageUrl),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                          child: Stack(
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        cartItem.title!,
                                        style: AppTextStyles.mPlusRounded1c(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    PopupMenuButton(
                                        padding: EdgeInsets.all(0.0),
                                        child: Icon(Icons.more_vert),
                                        onSelected: (selected) {},
                                        itemBuilder: (context) {
                                          final _textStyle =
                                              AppTextStyles.mPlusRounded1c(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500);
                                          return <PopupMenuItem>[
                                            PopupMenuItem(
                                              height: 20,
                                              child: Text(
                                                'highlight'.tr,
                                                style: _textStyle,
                                              ),
                                            ),
                                            PopupMenuItem(
                                              height: 20,
                                              child: Text(
                                                'to_favorites'.tr,
                                                style: _textStyle,
                                              ),
                                            ),
                                            PopupMenuItem(
                                              height: 20,
                                              child: Text(
                                                'delete'.tr,
                                                style: _textStyle,
                                              ),
                                            ),
                                            PopupMenuItem(
                                              height: 20,
                                              child: Text(
                                                'cancel'.tr,
                                                style: _textStyle,
                                              ),
                                            ),
                                          ];
                                        }),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '${cartItem.price} c.',
                                      style: AppTextStyles.mPlusRounded1c(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ]),
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        'min_quantity_of'.trParams({'count': '25 шт.'})!,
                        textAlign: TextAlign.end,
                        style: AppTextStyles.mPlusRounded1c(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: context.theme.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: ValueBuilder<Cart>(
                          initialValue: cartItem,
                          builder: (_cartItem, update) {
                            print('cart ${_cartItem.toMap()}');
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${_cartItem.quantity * cartItem.price!} c.',
                                  style: AppTextStyles.mPlusRounded1c(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        update(cart.increaseItem(_cartItem));
                                      },
                                      child: AppIcon(
                                        AppIcons.plus_outlined,
                                        color: context.theme.primary,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text('${cartItem.quantity}',
                                        style: AppTextStyles.mPlusRounded1c(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(width: 5),
                                    InkWell(
                                        onTap: () {
                                          update(cart.decreaseItem(_cartItem));
                                        },
                                        child: AppIcon(
                                          AppIcons.minus_outlined,
                                          color: context.theme.primary,
                                          size: 30,
                                        )),
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(indent: 10, endIndent: 10),
            Container(
              child: Container(
                child: ExpandablePanel(
                  header: Row(
                    children: [
                      Icon(Icons.keyboard_arrow_down, size: 26),
                      const SizedBox(width: 10),
                      Text('additional_services'.tr + ':',
                          style: AppTextStyles.mPlusRounded1c(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Center(
                          child: Text('500 C.',
                              style:
                                  AppTextStyles.mPlusRounded1c(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                  collapsed: Container(),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text('assembly_services'.tr + ':',
                          style: AppTextStyles.mPlusRounded1c(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Radio(
                                value: 0,
                                groupValue: 0,
                                activeColor: context.theme.primary,
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Теннисный стол Хобби',
                              style: AppTextStyles.mPlusRounded1c(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Center(
                                    child: Text(
                              '500 C.',
                              style: AppTextStyles.mPlusRounded1c(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )))
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Radio(
                                value: 1,
                                activeColor: context.theme.primary,
                                groupValue: 0,
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Теннисный стол Хобби',
                              style: AppTextStyles.mPlusRounded1c(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Center(
                                    child: Text(
                              '500 C.',
                              style: AppTextStyles.mPlusRounded1c(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )))
                          ],
                        ),
                      ),
                    ],
                  ),
                  theme: ExpandableThemeData(
                    hasIcon: false,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
