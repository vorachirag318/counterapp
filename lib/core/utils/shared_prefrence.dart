import 'package:get_storage/get_storage.dart';

class LocalDB {
  static final sharedPreference = GetStorage();
  static writeLastCount(Map<String, dynamic> map) {
    sharedPreference.write("lastCount", map);
  }

  static Map<String, dynamic>? readLastCount() {
    if (sharedPreference.hasData("lastCount")) {
      return sharedPreference.read("lastCount");
    }
  }
}
