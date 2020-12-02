import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatee/core/models/user_model.dart';

class UserFirestoreHelper {
  static final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");

  // Create a user
  static Future<void> createUser(UserModel user) async {
    try {
      final res = await _usersCollection.doc(user.id).set(user.toJson());
      return res;
    } catch (e) {
      return null;
    }
  }

  // Update user information
  static Future updateUser(UserModel user) async {
    try {
      await _usersCollection.doc(user.id).update(user.toJson());
      return true;
    } catch (e) {
      return e.message;
    }
  }
}
