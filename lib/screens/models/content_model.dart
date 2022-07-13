import 'package:cloud_firestore/cloud_firestore.dart';

class ContentModel {
  String? contentCategory;
  String? contentCourse;
  String? contentDescription;
  String? contentFile;
  String? contentId;
  String? contentType;
  Timestamp? createdAt;
  Null? deletedAt;
  String? formatType;
  bool? status;

  ContentModel(
      {this.contentCategory,
      this.contentCourse,
      this.contentDescription,
      this.contentFile,
      this.contentId,
      this.contentType,
      this.createdAt,
      this.deletedAt,
      this.formatType,
      this.status});

  ContentModel.fromJson(Map<String, dynamic> json) {
    contentCategory = json['content_category'];
    contentCourse = json['content_course'];
    contentDescription = json['content_description'];
    contentFile = json['content_file'];
    contentId = json['content_id'];
    contentType = json['content_type'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    formatType = json['format_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content_category'] = this.contentCategory;
    data['content_course'] = this.contentCourse;
    data['content_description'] = this.contentDescription;
    data['content_file'] = this.contentFile;
    data['content_id'] = this.contentId;
    data['content_type'] = this.contentType;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.deletedAt;
    data['format_type'] = this.formatType;
    data['status'] = this.status;
    return data;
  }
}
