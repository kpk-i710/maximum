import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import '../../widgets/widgets.dart' as widgets;
import 'brand_item_widget.dart';

class BrandGridWidget extends StatelessWidget {
  BrandGridWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 350),
      child: GridView.count(
        childAspectRatio: 2 / 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        crossAxisCount: 3,
        children: List.generate(
            16, (index) =>BrandItemWidget()),

        primary: false,
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
