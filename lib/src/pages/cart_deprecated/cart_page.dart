import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/widgets/app_icon.dart';
import '../../cart_controller.dart';
import '../../styles.dart';
import '../../widgets/cart_widgets/cart_list_widget.dart';
import '../../widgets/cart_widgets/cart_own_widget.dart';
import '../../widgets/product_widgets/products_carousel_widget.dart';
import '../../widgets/widgets.dart' as widgets;
import 'cart_page_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({key}) : super(key: key);

  final controller = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: context.theme.background,
        automaticallyImplyLeading: false,
        title: Text(
          'cart'.tr,
          style: AppTextStyles.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: AppIcon(AppIcons.share, color: context.theme.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<CartPageController>(builder: (controller) {
          if (controller.getCartItems().isEmpty)
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                children: [
                  if (Prefs.isLogin)
                    Obx(() {
                      return Visibility(
                        visible: controller.isLoaded.value,
                        child: SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                              itemCount: controller.ownCartList?.length,
                              itemBuilder: (context, index) {
                                return CardOwnWidget(
                                  ownCard: controller.ownCartList![index],
                                );
                              }),
                        ),
                        replacement: Center(child: CircularProgressIndicator()),
                      );
                    })
                  else
                    EmptyCart(),
                  const SizedBox(height: 20),
                  widgets.bigFullWidthButton(
                    text: 'product_catalog'.tr.toUpperCase(),
                    bgColor: context.theme.primary,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'viewed_products'.tr,
                        style: AppTextStyles.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProductsCarouselWidget(
                    list: controller.viewedProductsList,

                  ),
                ],
              ),
            );

          return Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CartListWidget(
                  list: controller.getCartItems(),

                ),
              ),
              const SizedBox(height: 20),
              if (Prefs.isLogin)
                ...authorizedWidgets(context)
              else
                ...notAuthorizedWidgets(context),
            ],
          );
        }),
      ),
    );
  }

  List<Widget> authorizedWidgets(BuildContext context) {
    final _robotoTextStyle = AppTextStyles.roboto(
      fontSize: 14,
      color: context.theme.mainTextColor.withOpacity(0.6),
    );
    return [
      cardButton(
        onClick: () {
          Get.toNamed(AppRouter.deliveryMethod);
        },
        child: Row(
          children: [
            AppIcon(AppIcons.store, color: context.theme.primary),
            const SizedBox(width: 20),
            Text(
              'Выберите способ доставки',
              style: AppTextStyles.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
      cardButton(
        onClick: () {
          Get.toNamed(AppRouter.paymentMethod);
        },
        child: Row(
          children: [
            AppIcon(AppIcons.payment_filled, color: context.theme.primary),
            const SizedBox(width: 20),
            Text(
              'Выберите способ оплаты',
              style: AppTextStyles.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
      cardButton(
        onClick: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(AppIcons.store, color: context.theme.primary),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Пункт выдачи заказов',
                    style: AppTextStyles.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'г. Бишкек ул. Медерова 8/2',
                    style: AppTextStyles.mPlusRounded1c(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Рабочий график: с 9:00 до 18.00',
                    style: AppTextStyles.mPlusRounded1c(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: context.theme.mainTextColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Бесплатно',
                    style: AppTextStyles.roboto(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: context.theme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            AppIcon(AppIcons.edit_alt),
          ],
        ),
      ),
      const SizedBox(height: 20),
      cardButton(
        onClick: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(AppIcons.car_ride, color: context.theme.primary),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Курьером по городу',
                    style: AppTextStyles.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'г. Бишкек ул. Жантошева 113',
                    style: AppTextStyles.mPlusRounded1c(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Доставим: с 9:00 до 11.00',
                    style: AppTextStyles.mPlusRounded1c(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: context.theme.mainTextColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Платная доставка от 150 сом',
                    style: AppTextStyles.roboto(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: context.theme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            AppIcon(AppIcons.edit_alt),
          ],
        ),
      ),
      const SizedBox(height: 20),
      cardButton(
        onClick: () {},
        child: Row(
          children: [
            AppIcon(AppIcons.payment_filled, color: context.theme.primary),
            const SizedBox(width: 20),
            Text(
              'Наличными в офисе',
              style: AppTextStyles.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 40),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 14, 0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 25,
                  child: Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Получатель другой чловек',
                  style: AppTextStyles.robotoCondensed(
                    fontSize: 16,
                    color: context.theme.mainTextColor.withOpacity(0.6),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: context.theme.surface,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'last_name'.tr,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: context.theme.surface,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'name'.tr,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: context.theme.surface,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'phone_number'.tr,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 40),
      Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ваш заказ будет выполнен с 15 по 22 марта ',
                      style: AppTextStyles.robotoCondensed(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Товаров:', style: _robotoTextStyle),
                            Text('Цена без скидки:', style: _robotoTextStyle),
                            Text('Скидка:', style: _robotoTextStyle),
                            Text('Доставка:', style: _robotoTextStyle),
                          ],
                        ),
                        const SizedBox(width: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('3', style: _robotoTextStyle),
                            Text('59500', style: _robotoTextStyle),
                            Text('1200', style: _robotoTextStyle),
                            Text('150', style: _robotoTextStyle),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Итого к оплате:',
                          style: AppTextStyles.roboto(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '56 850 с.',
                          style: AppTextStyles.mPlusRounded1c(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              widgets.fullWidthButton(
                  text: 'ЗАКАЗ ПОДТВЕРЖДАЮ',
                  icon: AppIcons.list_check,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> notAuthorizedWidgets(BuildContext context) => [
        Card(
            elevation: 8,
            margin: const EdgeInsets.all(0),
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: widgets.fullWidthButton(
                text: 'login_or_register'.tr,
                icon: AppIcons.person,
                iconSize: 18,
                onPressed: () {
                  Get.toNamed('/auth');
                },
              ),
            )),
        const SizedBox(height: 25),
        widgets
            .titleWidget(title: 'viewed_products'.tr)
            .paddingSymmetric(horizontal: 12),
        Obx(() => ProductsCarouselWidget(
              list: controller.viewedProductsList,

            )),
        const SizedBox(height: 40),
        widgets.supportCenterButton().paddingSymmetric(horizontal: 14),
        const SizedBox(height: 20),
      ];

  Widget cardButton(
          {Widget? child, Function()? onClick, EdgeInsets? padding}) =>
      Card(
          elevation: 6,
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: InkWell(
            onTap: onClick,
            child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: child ?? Container(),
            ),
          ));
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/deliverycar.png',
            width: double.infinity, height: 200),
        const SizedBox(height: 20),
        Text(
          'cart_empty'.tr,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'never_late_to_fix'.tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: context.theme.grey,
          ),
        ),
      ],
    );
  }
}
