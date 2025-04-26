import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:product_list/localisation/translation.dart';
import 'package:product_list/router/route_path.dart';
import 'package:product_list/router/routes.dart';
import "package:flutter_localizations/flutter_localizations.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome
      .setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ],
  )
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RoutePath.categoriesPath,
      debugShowCheckedModeBanner: false,
      getPages: Routes.routers,
      locale: Get.deviceLocale,
      supportedLocales: const [AppTranslation.th, AppTranslation.en],
      fallbackLocale: AppTranslation.en,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: AppTranslation(),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}