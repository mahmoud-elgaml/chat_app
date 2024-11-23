import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talkio_app/Features/auth/model/user_model.dart';

class FireAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  static User user = auth.currentUser!;

  static Future createUser() async {
    UserModel userModel = UserModel(
      name: user.displayName ?? "",
      id: user.uid,
      email: user.email ?? "",
      createdAt: DateTime.now().toString(),
      lastActivated: DateTime.now().toString(),
      pushToken: "",
      about: "Hello Mahmoud",
      online: false,
      image: "",
    );
    await firebaseFireStore.collection("users").doc(user.uid).set(
          userModel.toJson(),
        );
  }
}
