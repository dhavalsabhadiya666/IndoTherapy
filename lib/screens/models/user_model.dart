class FirebaseUser {
  String? createdAt;
  String? expiryDate;
  String? updateDate;
  String? deletedAt;
  String? email;
  String? firstname;
  bool? isBlocked;
  String? password;
  String? plan;
  String? profilePic;
  int? registerVia;
  String? userId;
  String? questionOne;
  String? questionTwo;
  String? questionThree;
  String? questionFour;
  Map<String, dynamic>? cardDetails;

  FirebaseUser({
    this.createdAt,
    this.expiryDate,
    this.deletedAt,
    this.email,
    this.firstname,
    this.isBlocked,
    this.password,
    this.plan,
    this.profilePic,
    this.registerVia,
    this.userId,
    this.questionOne,
    this.questionTwo,
    this.questionThree,
    this.cardDetails,
    this.questionFour,
    this.updateDate,
  });

  FirebaseUser.fromJson(Map<String, dynamic> json) {
    createdAt = json['create_at'];
    expiryDate = json['expiryDate'];
    updateDate = json['updateDate'];
    deletedAt = json['deleted_at'];
    email = json['email'];
    firstname = json['firstname'];
    isBlocked = json['is_blocked'];
    password = json['password'];
    plan = json['plan'];
    profilePic = json['profile_pic'];
    registerVia = json['register_via'];
    userId = json['user_id'];
    questionOne = json['questionOne'];
    questionTwo = json['questionTwo'];
    questionThree = json['questionThree'];
    questionFour = json['questionFour'];
    cardDetails = json['cardDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = createdAt;
    data['expiryDate'] = expiryDate;
    data['updateDate'] = updateDate;
    data['deleted_at'] = deletedAt;
    data['email'] = email;
    data['firstname'] = firstname;
    data['is_blocked'] = isBlocked;
    data['password'] = password;
    data['plan'] = plan;
    data['profile_pic'] = profilePic;
    data['register_via'] = registerVia;
    data['user_id'] = userId;
    data['questionOne'] = questionOne;
    data['questionTwo'] = questionTwo;
    data['questionThree'] = questionThree;
    data['questionFour'] = questionFour;
    data['cardDetails'] = cardDetails;
    return data;
  }
}
