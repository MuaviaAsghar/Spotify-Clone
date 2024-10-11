import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';


class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
 final userBox = Hive.box("userBox");
  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      userBox.put('user', _auth.currentUser!.uid);
      return _auth.currentUser!.uid;
      
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
 
  }

  Future<void> signOutFromGoogle() async{
      await userBox.delete('user',);
    await _googleSignIn.signOut();
      await userBox.delete('user',);
    await _auth.signOut();
     
  }
}