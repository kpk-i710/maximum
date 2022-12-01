import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/search_widget_2/searchDeleg.dart';
import '../../widgets/widgets.dart' as widgets;

class SearchCatalogWidget extends StatelessWidget {
  const SearchCatalogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showSearch(context: context, delegate: searchDeleg());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 23),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffF9F9F9), borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              SizedBox(width: 15),
              Icon(
                Icons.search,
                color: Color(0xff807F85),
              ),
              SizedBox(width: 33),
              Text(
                "find_product_brand".tr,
                style: widgets.robotoConsid(color: Color(0xff807F85)),
              ),
              Spacer(),
              Icon(
                Icons.qr_code,
                color: Color(0xff807F85),
              ),
              SizedBox(width: 15),
            ],
          ),
          height: 47,
        ),
      ),
    );
  }
}
