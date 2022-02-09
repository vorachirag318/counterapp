import 'package:counterapp/core/constant/all_instance.dart';
import 'package:counterapp/core/service/firebase_service.dart';

class UserRepo {
  static Future<void> userLogin() async {
    if (AllInstance.firebaseAuth!.currentUser == null) {
      await AllInstance.firebaseAuth!.signInAnonymously();
      await FirebaseService.initField();
    }
  }
}
