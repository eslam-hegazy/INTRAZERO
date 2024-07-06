import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:tappyfi/core/routes/app_route.dart';
import 'package:tappyfi/features/home/presentation/screens/home_screen.dart';

List<GetPage> routes = [
  GetPage(
    name: AppRoute.rHomeScreen,
    page: () => HomeScreen(),
    transition: Transition.fade,
    transitionDuration:const Duration(milliseconds: 700),
  ),

];