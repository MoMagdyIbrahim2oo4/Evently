import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/data/model/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils {
  static Future<AppUser> register({
    required String email,
    required String password,
    required String userName,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    AppUser user = AppUser(
      id: credential.user!.uid,
      userName: userName,
      email: email,
    );
    await userCollection().doc(user.id).set(user);
    return user;
  }

  static Future<AppUser?> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final snapshot = await userCollection().doc(credential.user!.uid).get();
    return snapshot.data();
  }

  static Future<void> logout() async => await FirebaseAuth.instance.signOut();

  static CollectionReference<AppUser> userCollection() {
    return FirebaseFirestore.instance
        .collection(AppUser.collectionName)
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static String authErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-credential':
      case 'user-not-found':
      case 'wrong-password':
        return 'Wrong email or password.';

      case 'invalid-email':
        return 'That email address is not valid.';

      case 'email-already-in-use':
        return 'An account already exists for that email.';

      case 'weak-password':
        return 'Password is too weak. Use at least 6 characters.';

      case 'user-disabled':
        return 'This account has been disabled.';

      case 'too-many-requests':
        return 'Too many attempts. Try again later.';

      case 'network-request-failed':
        return 'No internet connection.';

      case 'operation-not-allowed':
        // Almost always a setup problem, not a user problem:
        // Email/Password has not been enabled in Firebase Console > Authentication.
        return 'Email sign-in is not enabled for this project.';

      default:
        return e.message ?? 'Something went wrong. Please try again.';
    }
  }
}
