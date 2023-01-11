import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';

final catalogProvider =
    FutureProvider.family.autoDispose<int, int>((ref, configFirst) async {
  ref.watch(currentVersionCatalog);
  return fetchProductsByCatalog();
});

Future<int> fetchProductsByCatalog() async {
  await Future.delayed(Duration(milliseconds: 300));
  return 0;
}
