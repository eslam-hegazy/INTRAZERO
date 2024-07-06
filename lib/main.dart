
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappyfi/core/routes/app_route.dart';
import 'package:tappyfi/core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.rHomeScreen,
      getPages: routes,
      navigatorKey: Get.key,
      defaultTransition: Transition.topLevel,
      
    );
  }
}
