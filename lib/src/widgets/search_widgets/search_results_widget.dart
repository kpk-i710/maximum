import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_controller.dart';
import '../product_widgets/product_item_widget.dart';

class SearchResultWidget extends StatelessWidget {
  final String heroTag;

  SearchResultWidget({Key? key, this.heroTag = 'search_result_'}) : super(key: key);

  SearchController _con = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              trailing: IconButton(
                icon: Icon(Icons.close),
                color: Theme.of(context).hintColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'search'.tr,
                style: Theme.of(context).textTheme.headline4,
              ),
              /*subtitle: Text(
                'ordered_by_nearby_first'.tr,
                style: Theme.of(context).textTheme.caption,
              ),*/
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onSubmitted: (text) async {
                _con.refreshSearch(text);
                // _con.saveSearch(text);
              },
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'search'.tr,
                hintStyle: Get.theme.textTheme.caption!.merge(TextStyle(fontSize: 14)),
                prefixIcon: Icon(Icons.search, color: Theme.of(context).accentColor),
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.1))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.3))),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.1))),
              ),
            ),
          ),
          Obx(() => _con.products.isEmpty ? Center(child: CircularProgressIndicator())
                : Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      title: Text(
                        'products_results'.tr,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _con.products.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      return ProductItemWidget(list: _con.products.elementAt(index),

                      );
                    },
                  ),
                  /*Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          title: Text(
                            S.of(context).markets_results,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: _con.restaurants.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/Details',
                                  arguments: RouteArgument(
                                    id: _con.restaurants.elementAt(index).id,
                                    heroTag: widget.heroTag,
                                  ));
                            },
                            child: CardWidget(restaurant: _con.restaurants.elementAt(index), heroTag: widget.heroTag),
                          );
                        },
                      ),*/
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
