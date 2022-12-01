import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/search_widget_2/searchDeleg.dart';
import '../../widgets/widgets.dart'as widgets;

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0xFF262963),
              const Color(0xFF9E2757),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
        child: GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: searchDeleg());
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 40, child: Center(child: Icon(Icons.search ))),
                Text("products_search".tr,style: widgets.robotoConsid(fontSize: 17),),
                Spacer(),
                SizedBox(width: 40, child: Center(child: Icon(Icons.mic_none))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
