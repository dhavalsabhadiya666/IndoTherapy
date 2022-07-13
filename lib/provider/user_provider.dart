import 'package:flutter/cupertino.dart';
import 'package:rewire/screens/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  FirebaseUser firebaseUser = FirebaseUser();
  FirebaseUser? get getUser => firebaseUser;
  setUser({required FirebaseUser currentUser}) {
    firebaseUser = currentUser;
    print("user added to providers");
    notifyListeners();
  }
}
