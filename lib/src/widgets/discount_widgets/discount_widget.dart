import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles.dart';
import '../../models/discount.dart';

class DiscountWidget extends StatelessWidget {
  final Discount discount;
  final String heroTag;

  DiscountWidget({required this.discount, this.heroTag = 'discount_'});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag + discount.id.toString(),
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          children: [
            Container(
              height: 280,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                        child: CachedNetworkImage(
                          imageUrl: discount.imageUrl!,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.all(32),
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        context.theme.primary),
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
                  Positioned(
                      left: 10,
                      bottom: 10,
                      child: Container(
                        color: context.theme.accent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        child: Text(
                          'discount'.tr.toUpperCase() +
                              ' -${discount.discountValue}%',
                          style: GoogleFonts.robotoCondensed(
                              color: context.theme.onAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${discount.word}',
                          style: GoogleFonts.mPlusRounded1c(
                              color: context.theme.grey, fontSize: 12),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${discount.days}',
                          style: GoogleFonts.robotoCondensed(
                              fontWeight: FontWeight.w900, fontSize: 28),
                        ),
                        Text(
                          '${discount.wordDay}',
                          style: GoogleFonts.mPlusRounded1c(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 80, width: 1, color: Colors.grey.withAlpha(70)),
                  Expanded(
                    flex: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text('${discount.message}',
                              style: GoogleFonts.mPlusRounded1c(
                                  color: Colors.grey[600], fontSize: 16)),
                          Text('${discount.title}',
                              style: GoogleFonts.mPlusRounded1c(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
