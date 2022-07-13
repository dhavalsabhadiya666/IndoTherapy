import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  String? courseDescription;
  String? courseId;
  String? courseImage;
  String? courseName;
  Timestamp? createdAt;
  Timestamp? deletedAt;
  bool? status;

  CourseModel(
      {this.courseDescription,
      this.courseId,
      this.courseImage,
      this.courseName,
      this.createdAt,
      this.deletedAt,
      this.status});

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseDescription = json['course_description'];
    courseId = json['course_id'];
    courseImage = json['course_image'];
    courseName = json['course_name'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_description'] = this.courseDescription;
    data['course_id'] = this.courseId;
    data['course_image'] = this.courseImage;
    data['course_name'] = this.courseName;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.deletedAt;
    data['status'] = this.status;
    return data;
  }
}
