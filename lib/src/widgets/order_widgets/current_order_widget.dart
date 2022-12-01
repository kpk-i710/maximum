import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles.dart';
import '../../models/order.dart';
import '../app_icon.dart';
import '../widgets.dart';

class CurrentOrderWidget extends StatelessWidget {
  final Order order;
  final list = <String>[
    'assets/images/im1.png',
    'assets/images/im1.png',
    'assets/images/im1.png',
    'assets/images/im1.png'
  ];

  CurrentOrderWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: context.theme.surface,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: InkWell(
        onTap: () {
          Get.toNamed('/order', arguments: order);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16.0),
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('К оплате, сом:',
                          style: AppTextStyles.roboto(
                              fontSize: 11,
                              color: context.theme.mainTextColor.withOpacity(0.6)),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                            color: context.theme.primary,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('85600',
                            style: AppTextStyles.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: context.theme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Оплачено,сом:',
                          style: AppTextStyles.roboto(
                              fontSize: 11,
                              color: context.theme.mainTextColor.withOpacity(0.6)),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: context.theme.greyWeak, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('0',
                            style: AppTextStyles.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Остаток оплаты, сом:',
                          style: AppTextStyles.roboto(
                              fontSize: 10,
                              color: context.theme.mainTextColor.withOpacity(0.6)),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: context.theme.greyWeak, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('856000',
                            maxLines: 1,
                            style: AppTextStyles.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              const SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIcon(AppIcons.car_ride, color: context.theme.primary),
                  SizedBox(width: 10),
                  Text('courier'.tr + ':',
                    style: AppTextStyles.roboto(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Катаранчук П.',
                        style: AppTextStyles.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.primary),
                      ),
                      const SizedBox(height: 4),
                      Text('deliver_from_to'.trParams({'from': '9.00', 'to': '18.00'})!,
                        style: AppTextStyles.roboto(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.green)
                    ),
                    child: Row(
                      children: [
                        Text('call'.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.roboto(
                              color: Colors.green,
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        AppIcon(AppIcons.phone_call, color: Colors.green)
                      ],
                    ),
                  ),
                ],
              ),
              /*Container(
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
