import 'package:counterapp/ui/landing_screen/controller/landing_controller.dart';
import 'package:get/get.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController(), fenix: true);
  }
}
