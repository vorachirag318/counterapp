import 'package:counterapp/ui/landing_screen/landingscreen.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: LandingScreen.routeName, page: () => LandingScreen()),
];
