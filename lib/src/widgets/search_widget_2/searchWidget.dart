import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/between_pages_all/between_all_pages.dart';
import 'package:maxkgapp/src/pages/filter/filter_page.dart';
import 'package:maxkgapp/src/pages/filter/filter_page_controller.dart';

import 'package:maxkgapp/src/widgets/search_widget_2/searchDeleg.dart';
import '../../widgets/widgets.dart' as widgets;

class SearchWidget extends ConsumerWidget {
    SearchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
        child: TextField(
          onSubmitted: (value) {
            Get.to(() => BetweenAllPages());

            ref.read(isSearchedProvider.notifier).state = true;
          },
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Поиск товаров',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.mic_none),
          ),
        ),
      ),
    );
  }
}
