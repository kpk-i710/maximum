import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../models/own_cart.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class CardOwnWidget extends StatelessWidget {
  final OwnCartModel ownCard;

  const CardOwnWidget({super.key, required this.ownCard});

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 0,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 0.8, vertical: 0.8),
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200, width: 0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 70,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://max.kg/nal/img/${ownCard.idPost}/b_${ownCard.img}??:" "",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(32),
                                child: CircularProgressIndicator(
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
                      top: 0,
                      right: 0,
                      child: IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: Icon(MaterialCommunityIcons.heart))),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text('- 50%',
                                style: AppTextStyles.mPlusRounded1c(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0))),
                        SizedBox(width: 5),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text('Хит'.toUpperCase(),
                                style: AppTextStyles.mPlusRounded1c(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 20,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ownCard.price != 0
                                  ? Text(
                                     "${ ownCard.price} сом", style: AppTextStyles.mPlusRounded1c(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          decorationColor: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  : widgets.rating(5),
                              Text(
                                  "${ ownCard.cena0} сом",
                                style: AppTextStyles.mPlusRounded1c(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
