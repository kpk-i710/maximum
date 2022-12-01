import 'package:flutter/material.dart';
import '../../widgets/widgets.dart' as widgets;
import 'brand_item_widget.dart';

class BrandGridWidget extends StatelessWidget {
  BrandGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 114 / 77,
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 6,
        ),
        itemCount: 9,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
              alignment: Alignment.center, child: BrandItemWidget());
        });
  }
}
