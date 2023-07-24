import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> signInWithEmail({required String email, required String password}) async {
  UserCredential? userCredential;
  try {
    userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseException catch (e) {
    print(e);
  }

  return userCredential;
}
