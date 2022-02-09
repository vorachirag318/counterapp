import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AllInstance {
  static late final FirebaseAuth? firebaseAuth = FirebaseAuth.instance;
  static late final FirebaseFirestore? fireStore = FirebaseFirestore.instance;
  static final User? user = AllInstance.firebaseAuth!.currentUser;
  static final CollectionReference userReference =
      FirebaseFirestore.instance.collection("User");
}
