import 'package:counterapp/core/service/userRepo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/utils/bindings.dart';
import 'core/utils/routes.dart';
import 'ui/landing_screen/landingscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //--Firebase initialize
  await Firebase.initializeApp();
  await GetStorage.init();
  await UserRepo.userLogin();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CounterApp',
      initialBinding: LandingBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: LandingScreen.routeName,
      getPages: routes,
    );
  }
}
