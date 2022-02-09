import 'package:counterapp/core/service/firebase_service.dart';
import 'package:counterapp/core/utils/shared_prefrence.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  int _tabCurrentIndex = 0;

  int get tabCurrentIndex => _tabCurrentIndex;

  set tabCurrentIndex(int value) {
    _tabCurrentIndex = value;
    update();
  }

  Map<String, dynamic> allCounter = {
    "counter1": 0,
    "counter2": 0,
    "counter3": 0,
  };

  void counterIncrease({required String key}) {
    allCounter.update(key, (value) {
      FirebaseService.updateCount(key: key, value: value + 1);
      return value += 1;
    });
    update();
  }

  void setDefaultCount() {
    allCounter = {
      "counter1": 0,
      "counter2": 0,
      "counter3": 0,
    };
    LocalDB.writeLastCount(allCounter);
    FirebaseService.initField();
    update();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    LocalDB.writeLastCount(allCounter);
    super.update(ids, condition);
  }

  @override
  void onInit() {
    if (LocalDB.readLastCount() != null) {
      allCounter = LocalDB.readLastCount()!;
      FirebaseService.initField(map: allCounter);
    }
    super.onInit();
  }
}
