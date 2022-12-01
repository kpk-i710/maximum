import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles.dart';
import '../../models/order.dart';
import '../app_icon.dart';
import '../widgets.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  final list = <String>[
    'assets/images/im1.png',
    'assets/images/im1.png',
    'assets/images/im1.png',
    'assets/images/im1.png'
  ];
  
  OrderWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: context.theme.surface,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Get.toNamed('/order', arguments: order);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('order'.tr + ' №${order.id} ',
                        style: AppTextStyles.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: context.theme.primary),
                      ),
                      const SizedBox(height: 2),
                      Text('from'.tr + ' ${order.date}',
                        style: AppTextStyles.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: context.theme.mainTextColor.withOpacity(0.6)
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppIcon(AppIcons.chat, color: context.theme.primary),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          Text('manager'.tr + ':',
                            style: AppTextStyles.roboto(
                                fontSize: 12, fontWeight: FontWeight.w400,
                                color: context.theme.grey),
                          ),
                          Text('Эльвира',
                            style: AppTextStyles.roboto(
                                fontSize: 14, fontWeight: FontWeight.w500,
                                color: context.theme.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const Divider(),
              SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 120,
                      padding: EdgeInsets.only(
                          left: (index == 0) ? 0 : 0, // first element left padding 12
                          right: (index == list.length - 1)
                              ? 0
                              : 10), // last element right padding 12
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                          child: Image.asset(list[index], fit: BoxFit.cover, width: 120),
                      ),
                    );
                  },
                  itemCount: list.isEmpty ? 4 : list.length,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: order.status == OrderStatus.NOT_VERIFIED
                        ? context.theme.greyMedium
                        : order.status == OrderStatus.VERIFIED
                        ? context.theme.primary
                        : context.theme.greyStrong,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    order.status == OrderStatus.NOT_VERIFIED
                        ? 'Закрыт'
                        : order.status == OrderStatus.VERIFIED
                        ? 'completed'.tr
                        : 'canceled'.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.roboto(
                        color: context.theme.onPrimary,
                        fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('how_satisfied_are_you_with_courier_service'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyles.roboto(
                    fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rating(4, iconSize: 30),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    primary: context.theme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.green),
                    ),
                  ),
                  child: Text('write_review'.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.roboto(
                        color: Colors.green,
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
