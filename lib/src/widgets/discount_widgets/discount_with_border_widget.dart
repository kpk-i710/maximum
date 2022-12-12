import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../helpers/helper.dart';
import '../../models/discount.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../styles.dart';

class DiscountWithBorderWidget extends StatelessWidget {
  final Discount discount;
  DiscountWithBorderWidget({required this.discount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 285,
          width: Helper.responsive(100.0.w, md: 50.0.w, lg: 20.0.w, xl: 10.0.w),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(color: context.theme.accent, width: 5)),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    Expanded(
                      flex: 50,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Container(
                          height: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                              imageUrl: discount.image!,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url, progress) {
                                return Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(32),
                                    child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          context.theme.focus),
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
                      ),
                    ),
                    Expanded(
                        flex: 50,
                        child: Stack(
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Center(
                                        child: Text(
                                          'until_end_of_discount'.tr,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: AppTextStyles
                                              .mPlusRounded1c(fontSize: 11),
                                        ),
                                      ),
                                  ),
                                  const SizedBox(height: 6),

                                  const SizedBox(height: 3),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets
                                          .symmetric(horizontal: 18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Text('46 850 СОМ',
                                                style: AppTextStyles.mPlusRounded1c(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w500,
                                                    decoration:
                                                        TextDecoration.lineThrough),
                                              ),
                                            ],
                                          ),
                                          Text('58 850 СОМ',
                                            maxLines: 1,
                                            style: AppTextStyles.mPlusRounded1c(
                                              color: context.theme.accent,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text('Вы секономите 1500 сом',
                                            maxLines: 1,
                                            style: AppTextStyles
                                                .mPlusRounded1c(fontSize: 12.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(horizontal: 15),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: widgets.button(
                                          text: 'Купить', onPressed: () {}),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              const Divider(indent: 10, endIndent: 10),
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                      'Сканер диагностический Autel MaxiDAS DS808BT, Haynes '
                          'Tech Basic, российская версия ',
                      style: AppTextStyles.mPlusRounded1c(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Text('- 55%',
                    style: AppTextStyles.robotoCondensed(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
