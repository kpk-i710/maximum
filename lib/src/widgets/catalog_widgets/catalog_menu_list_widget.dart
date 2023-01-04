import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/catalog.dart';
import '../../styles.dart';
import 'catalog_list_item_widget.dart';

class CatalogMenuListWidget extends StatefulWidget {
  final List<Catalog> catalogList;
  final String heroTag;
  final Function(dynamic val)? onTap;
  final Function()? onBack;
  final Function()? toMain;
  final List<_CatalogMenuItem> parents;

  CatalogMenuListWidget({Key? key, required this.catalogList, this.heroTag = 'catalog_item_',
    this.onTap, this.onBack, this.toMain, this.parents = const []}) : super(key: key);

  @override
  _CatalogMenuListWidgetState createState() => _CatalogMenuListWidgetState();
}

class _CatalogMenuListWidgetState extends State<CatalogMenuListWidget> {
  final pageController = PageController();

  int _catalogIndex = 0;

  List<_CatalogMenuItem> parents = [];

  @override
  void initState() {
    parents.addAll(widget.parents);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            if (widget.catalogList[0] != null && widget.catalogList[0].parent != '0')
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.keyboard_arrow_left),
                    title: Transform.translate(
                      offset: Offset(-25, 0),
                      child: Text('Главное меню',
                          style: AppTextStyles.mPlusRounded1c(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                      ),
                    ),
                    onTap: widget.toMain,
                  ),
                  divider(indent: 20, endIndent: 20),
                ],
              ),
            if ( widget.parents.isNotEmpty )
              Column(
                children: [
                  for (int i = 0; i < widget.parents.length - 1; i++)
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.keyboard_arrow_left),
                          title: Transform.translate(
                            offset: Offset(-25, 0),
                            child: Text('${widget.parents[i].title}',
                                style: AppTextStyles.mPlusRounded1c(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                            ),
                          ),
                          onTap: () => widget.parents[i].onTap!(),
                        ),
                        divider(indent: 20, endIndent: 20),
                      ],
                    ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: context.theme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                        '${widget.parents[widget.parents.length - 1].title}',
                        style: AppTextStyles.mPlusRounded1c(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: context.theme.onPrimary,
                        ),
                    ),
                  ),
                ],
              ),
            Divider(),
            Expanded(
              child: ListView.separated(
                itemCount: widget.catalogList.length,
                separatorBuilder: (context, index) {
                  return Divider(indent: 20, endIndent: 20);
                },
                itemBuilder: (context, index) {

                  Catalog cat = widget.catalogList[index];
                  return CatalogListItemWidget(
                    catalog: cat,
                    onTap: () {
                      if ( cat.children == null || cat.children!.length == 0 ) {
                        widget.onTap!(cat.id);
                      } else {
                        setState(() {
                          _catalogIndex = index;
                        });
                        if (parents.isNotEmpty && parents[parents.length - 1] != null) {
                          final title = parents[parents.length - 1].title;
                          parents[parents.length - 1] = _CatalogMenuItem(
                              title, onTap: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 1),
                                    curve: Curves.easeOut,
                                );
                              },
                          );
                        }
                        addToParents(_CatalogMenuItem(cat.name!));
                        pageController.nextPage(
                            duration: Duration(milliseconds: 1),
                            curve: Curves.easeIn,
                        );
                      }
                    }, index: index,
                  );
                },
              ),
            ),
          ],
        ),
        if (widget.catalogList[_catalogIndex].children != null)
          CatalogMenuListWidget(
            catalogList: widget.catalogList[_catalogIndex].children!,
            heroTag: widget.heroTag + _catalogIndex.toString(),
            onTap: (catId) => widget.onTap!(catId),
            parents: parents,
            toMain: widget.toMain ?? () {
              clearParams();
              pageController.previousPage(
                  duration: Duration(milliseconds: 1),
                  curve: Curves.easeOut,
              );
            },
          )
        else Container(),
      ],
    );
  }

  Widget divider({double indent = 0.0,
    double endIndent = 0.0,
    double thickness = 1,
    double verticalMargin = 2.5}) => Container(
      height: thickness,
      margin: EdgeInsets.only(top: verticalMargin, bottom: verticalMargin,
          left: indent, right: endIndent),
      color: context.theme.greyWeak.withOpacity(0.70),
  );

  void addToParents(_CatalogMenuItem _item) {
    if(parents.indexWhere((item) => item.title == _item.title) <= 0)
      parents.add(_item);
  }

  void clearParams() {
    setState(() {
      _catalogIndex = 0;
      parents.clear();
    });
  }
}

class _CatalogMenuItem {
  String title;
  Function? onTap;
  _CatalogMenuItem(this.title, {this.onTap});
}