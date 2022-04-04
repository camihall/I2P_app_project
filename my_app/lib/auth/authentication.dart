import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User?> emailSignIn(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password
    );
    User user = userCredential.user!;
    return user; 
  } on FirebaseAuthException {
    rethrow;
  }
}

Future<User?> emailSignUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
    User user = userCredential.user!;
    return user;
  } on FirebaseAuthException {
      rethrow;
  } catch (e) {
      rethrow;
  }
}

User? getCurrentUser() {
  return auth.currentUser;
}

Future<void> emailSignOut() async {
  return auth.signOut();
}

Future<User?> signInWithGoogle() async {
  // Initialize Firebase
  await Firebase.initializeApp();
  User? user;

  // The `GoogleAuthProvider` can only be used while running on the web 
  GoogleAuthProvider authProvider = GoogleAuthProvider();

  authProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');

  authProvider.setCustomParameters({
    'login_hint': 'user@example.com'
  });

  try {
    final UserCredential userCredential = await auth.signInWithPopup(authProvider);
    user = userCredential.user;
  } catch (e) {
    rethrow;
  }

  if (user != null) {
    return user;
  }

  return null;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  await auth.signOut();
  
  print("User signed out of Google account");
}
