import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../screens/models/social_auth_model.dart';

Future<SocialAuthResult> signInWithFacebook() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  SocialAuthResult result = SocialAuthResult();
  try {
    final LoginResult loginResult = await _facebookAuth.login();
    if (loginResult.status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.token);

      final UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);
      result.email = userCredential.user?.email;
      result.status = true;
      result.message = loginResult.message;
      result.userCredential = userCredential;
    } else {
      result.status = false;
      result.message = loginResult.message;
    }
  } catch (e) {
    result.status = false;
    result.message = e.toString();
  }
  return result;
}
