import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rewire/screens/models/content_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/user_provider.dart';
import '../screens/models/feedback_model.dart';
import '../screens/models/user_model.dart';
import '../utils/firebase_references.dart';

class ProfileService {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection(FirebaseReferences.userCollection);
  static final CollectionReference _feedbackCollection = FirebaseFirestore
      .instance
      .collection(FirebaseReferences.feedbackCollection);

  ///set user
  Future setUser(
      FirebaseUser firebaseUser, BuildContext context, String? uid) async {
    final DocumentReference data = _userCollection.doc();
    firebaseUser.userId = uid;

    firebaseUser.createdAt = DateTime.now().toString();

    DateTime currentDateTime = DateTime.now();
    if (firebaseUser.plan == 'Yearly') {
      firebaseUser.expiryDate = DateTime(currentDateTime.year,
              currentDateTime.month, currentDateTime.day + 365)
          .toString();
    } else if (firebaseUser.plan == 'Monthly') {
      firebaseUser.expiryDate = DateTime(currentDateTime.year,
              currentDateTime.month, currentDateTime.day + 30)
          .toString();
    } else if (firebaseUser.plan == 'Free Trial') {
      firebaseUser.expiryDate = DateTime(currentDateTime.year,
              currentDateTime.month, currentDateTime.day + 14)
          .toString();
    }

    Provider.of<UserProvider>(context, listen: false)
        .setUser(currentUser: firebaseUser);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid!);
    return _userCollection.doc(uid).set(firebaseUser.toJson());
  }

  ///feedback
  Future<void> feedback(FeedbackModel feedbackModel) async {
    await _feedbackCollection
        .doc(feedbackModel.userId)
        .set(feedbackModel.toJson());
  }

  ///update user
  Future updateUser(
      FirebaseUser? firebaseUser, String? uid, String? updateDate, String? plan,
      {Map<String, String>? cardDetails}) async {
    final DocumentReference data = _userCollection.doc();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid!);

    firebaseUser?.createdAt = DateTime.now().toString();

    DateTime currentDateTime = DateTime.now();
    if (firebaseUser?.plan == 'Yearly') {
      firebaseUser?.expiryDate = DateTime(currentDateTime.year,
              currentDateTime.month, currentDateTime.day + 365)
          .toString();
    } else if (firebaseUser?.plan == 'Monthly') {
      firebaseUser?.expiryDate = DateTime(currentDateTime.year,
              currentDateTime.month, currentDateTime.day + 30)
          .toString();
    } else if (firebaseUser?.plan == 'Free Trail') {
      firebaseUser?.expiryDate = DateTime(currentDateTime.year,
              currentDateTime.month, currentDateTime.day + 14)
          .toString();
    }
    return _userCollection.doc(uid).update({
      "expiryDate": firebaseUser?.expiryDate,
      "updateDate": updateDate,
      "plan": plan,
      "cardDetails": cardDetails
    });
  }

  Future updateProfile(FirebaseUser firebaseUser) {
    return _userCollection
        .doc(firebaseUser.userId)
        .update(firebaseUser.toJson());
  }

  ///check email
  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      if (list.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return true;
    }
  }

  Future<User> handleSignInEmail(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', user.uid);
    return user;
  }

  Future checkUserByEmail(String email) {
    var snapshot = _userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  ///ContentData
  static Future<ContentModel?> contentData({required id}) {
    return FirebaseFirestore.instance
        .collection(FirebaseReferences.contentCollection)
        .where("content_course", isEqualTo: id)
        .get()
        .then((value) {
      if (value.docs.length > 0) {
        final doc = value.docs[0].data() as Map<String, dynamic>;
        ContentModel contentModel = ContentModel.fromJson(doc);
        return contentModel;
      }
      return null;
    });
  }

  ///CategoryData
  static Stream<QuerySnapshot<Map<String, dynamic>>> categoryData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection(FirebaseReferences.categoryCollection)
        .snapshots();
    return futureSnap;
  }

  ///CourseData
  static Stream<QuerySnapshot<Map<String, dynamic>>> courseData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection(FirebaseReferences.courseCollection)
        .snapshots();
    return futureSnap;
  }

  Future<FirebaseUser> getUserById({required id}) {
    return _userCollection.doc(id).get().then((value) {
      Map<String, dynamic> data = value.data() as Map<String, dynamic>;
      return FirebaseUser.fromJson(data);
    });
  }
}
