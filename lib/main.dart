import 'package:flutter/material.dart';
import 'package:flutter_task/common/theme/theme_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'common/app_routes/getx_routes.dart';
import 'common/controller/app_bindings.dart';
import 'common/localizations/app_locale.dart';
import 'common/theme/theme.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeService().getThemeMode(),
      initialRoute: AppPages.initial,
      // locale: Get.deviceLocale,
      locale: Locale('en'),
      translations: AppLocale(),
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
    );
  }
}
