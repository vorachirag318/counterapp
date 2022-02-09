import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counterapp/core/constant/all_instance.dart';

class FirebaseService {
  static Future<DocumentSnapshot?> fetchCounter() async {
    try {
      final refLogBooks =
          AllInstance.userReference.doc(AllInstance.user!.uid).get();
      return refLogBooks;
    } on Exception catch (e) {
      Future.error(e);
    }
  }

  static Future updateCount({
    required String key,
    required int value,
  }) async {
    try {
      await AllInstance.userReference.doc(AllInstance.user!.uid).update({
        key: value,
      });
    } on Exception catch (e) {
      Future.error(e);
    }
  }

  static Future initField({Map<String, dynamic>? map}) async {
    try {
      await AllInstance.userReference.doc(AllInstance.user!.uid).set(map ??
          {
            "counter1": 0,
            "counter2": 0,
            "counter3": 0,
          });
    } on Exception catch (e) {
      Future.error(e);
    }
  }
}
