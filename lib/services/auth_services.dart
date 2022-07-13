import 'package:flutter/cupertino.dart';
import 'package:rewire/services/profile_services.dart';

import '../screens/models/feedback_model.dart';
import '../screens/models/user_model.dart';

class AuthServices extends ChangeNotifier {
  Future saveUser({
    String? expiryDate,
    String? updateDate,
    String? firstName,
    String? email,
    String? password,
    String? uid,
    // String? questionOne,
    // String? questionTwo,
    // String? questionThree,
    String? questionFour,
    bool? is_blocked,
    String? plan,
    Map<String, dynamic>? cardDetails,
    required BuildContext context,
  }) async {
    FirebaseUser createUser = FirebaseUser(
        expiryDate: expiryDate,
        updateDate: updateDate,
        firstname: firstName,
        email: email,
        password: password,
        // questionOne: questionOne,
        // questionTwo: questionTwo,
        // questionThree: questionThree,
        questionFour: questionFour,
        plan: plan,
        cardDetails: cardDetails,
        isBlocked: false);

    ProfileService().setUser(createUser, context, uid);
  }

  Future feedback({
    String? comments,
    String? feedbackId,
    String? rating,
    String? type,
    String? userId,
  }) async {
    FeedbackModel feedback = FeedbackModel(
      type: type,
      comments: comments,
      rating: rating,
      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
    );

    await ProfileService().feedback(feedback);
  }
}
