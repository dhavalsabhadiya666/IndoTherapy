class FeedbackModel {
  String? comments;
  String? createdAt;
  String? rating;
  String? type;
  String? userId;

  FeedbackModel(
      {this.comments, this.createdAt, this.rating, this.type, this.userId});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    createdAt = json['created_at'];
    rating = json['rating'];
    type = json['type'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['created_at'] = this.createdAt;
    data['rating'] = this.rating;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    return data;
  }
}
