import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../models/discount.dart';
import '../../styles.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class DiscountGridItemWidget extends StatelessWidget {
  final Discount discount;

  final index;

  DiscountGridItemWidget({required this.discount, this.index});

  @override
  Widget build(BuildContext context) {
    final height = 180.0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0xffD9D9D9).withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: height,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 167,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CachedNetworkImage(
                  imageUrl: discount.imageUrl!,
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
                Positioned(
                  right: -150,
                  top: 40,
                  child: SizedBox(
                    height: 70,
                    width: 167,
                    child: Align(
                      alignment: Alignment(-1, -1),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: 184,
                          height: 60,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 10),
                                  child: Container(
                                    width: 138,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/time_dicount_background.png"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment(0.5, 0.9),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, bottom: 2),
                                        child: AutoSizeText(
                                          "${discount.word.toString()} ${discount.days.toString()}  ${discount.wordDay.toString().toLowerCase()}",
                                          maxLines: 1,
                                          maxFontSize: 10,
                                          minFontSize: 5,
                                          style: widgets.robotoConsid(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 184,
                                height: 41,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(index == 0
                                        ? "assets/images/discount_background_blue.png"
                                        : "assets/images/discount_background.png"),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "discount".tr +
                                        " - ${discount.discountValue.toString().toUpperCase()}%",
                                    style: widgets.robotoConsid(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                  child: Text(
                    discount.title.toString(),
                    maxLines: 2,
                    style: widgets.robotoConsid(
                        fontSize: 14,
                        fontWeight:
                            index == 0 ? FontWeight.w900 : FontWeight.normal,
                        color: Color(0xff494949)),
                  ),
                ),
                Spacer(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                  child: Text(
                    "validity".tr + "\n${discount.message}",
                    maxLines: 2,
                    style: widgets.robotoConsid(color: Color(0xff777777)),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// leading: CachedNetworkImage(
// width: 167,
// imageUrl: discount.imageUrl!,
// fit: BoxFit.cover,
// progressIndicatorBuilder: (context, url, progress) {
// return Center(
// child: Padding(
// padding: EdgeInsets.all(32),
// child: CircularProgressIndicator(
// value: progress.totalSize != null
// ? progress.downloaded / progress.totalSize!
//     : null),
// ),
// );
// },
// ),
