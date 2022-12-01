import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles.dart';
import '../../../helpers/app_router.dart';
import '../../../widgets/widgets.dart' as widgets;

class AddAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text('add_your_addresses'.tr,
                      style: AppTextStyles.robotoCondensed(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                addressWidget('ул.Медерова, 8', selected: true),
                const SizedBox(height: 15),
                addressWidget('ул. Жантошева 113'),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRouter.map);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Get.context!.theme.surface,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: context.theme.grey, size: 40),
                        const SizedBox(width: 10),
                        Text('add_address'.tr,
                          style: AppTextStyles.robotoCondensed(
                            fontSize: 20,
                            color: context.theme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                widgets.bigFullWidthButton(text: 'save'.tr, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addressWidget(String address, {bool selected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Get.context!.theme.surface,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: Checkbox(
                  value: selected,
                  onChanged: (value) {},
                  activeColor: Get.context!.theme.primary,
                ),
              ),
              const SizedBox(width: 15),
              Text('ул.Медерова, 8'),
            ],
          ),
          PopupMenuButton(
              padding: EdgeInsets.all(0.0),
              child: Icon(Icons.more_vert),
              onSelected: (selected) {},
              itemBuilder: (context) {
                final _textStyle = AppTextStyles
                    .mPlusRounded1c(
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                );
                return <PopupMenuItem>[
                  PopupMenuItem(
                    height: 20,
                    child: Text('highlight'.tr,
                      style: _textStyle,
                    ),
                  ),
                  PopupMenuItem(
                    height: 20,
                    child:
                    Text('to_favorites'.tr,
                      style: _textStyle,
                    ),
                  ),
                  PopupMenuItem(
                    height: 20,
                    child: Text('delete'.tr,
                      style: _textStyle,
                    ),
                  ),
                  PopupMenuItem(
                    height: 20,
                    child: Text('cancel'.tr,
                      style: _textStyle,
                    ),
                  ),
                ];
              }),
        ],
      ),
    );
  }

}