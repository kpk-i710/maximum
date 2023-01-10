import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:sizer/sizer.dart';
import 'src/helpers/app_bindings.dart';
import 'src/helpers/app_router.dart';
import 'src/helpers/helper.dart';
import 'src/helpers/app_translations.dart';
import 'src/helpers/db_helper.dart';
import 'src/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper().init();
  FlutterNativeSplash.remove();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil.setScreenSize(constraints, orientation);
        Helper.setConstraintsAndOrientation(constraints, orientation);
        return GetMaterialApp(
          debugShowCheckedModeBanner: true,
          locale: Prefs.selectedLang != null
              ? Locale(Prefs.selectedLang,
                  Prefs.selectedLang.toString().toUpperCase())
              : Locale('ru', 'RU'),
          translations: AppTranslations(),
          title: 'Max.kg',
          theme: AppTheme.lightTheme.themeData,
          darkTheme: AppTheme.darkTheme.themeData,
          themeMode: ThemeMode.light,
          initialRoute: AppRouter.initialRoute,
          getPages: AppRouter.pages,
          initialBinding: AppBindings(),
        );
      });
    });
  }
}
