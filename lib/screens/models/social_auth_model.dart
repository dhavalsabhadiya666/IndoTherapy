import 'package:firebase_auth/firebase_auth.dart';

class SocialAuthResult {
  bool? status;
  String? message;
  String? instaId;
  String? instaUsername;
  String? email;
  UserCredential? userCredential;

  SocialAuthResult(
      {this.status,
      this.message,
      this.instaId,
      this.instaUsername,
      this.userCredential,
      this.email});

  @override
  String toString() {
    return 'SocialAuthResult {status: $status, message: $message, instaId: $instaId, instaUsername: $instaUsername, userCredential: $userCredential}';
  }
}
