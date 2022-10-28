import 'package:docs_clone/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AuthRepoProvider =
    Provider((ref) => AuthRepo(googleSignIn: GoogleSignIn()));

class AuthRepo {
  final GoogleSignIn _googleSignIn;
  AuthRepo({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final userAcc = UserModel(
            email: user.email,
            name: user.displayName!,
            uid: '',
            profilePic: user.photoUrl!,
            token: '');
      }
    } catch (err) {
      print(err);
    }
  }
}
