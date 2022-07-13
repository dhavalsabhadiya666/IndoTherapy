import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? categoryId;
  String? categoryImage;
  String? categoryName;
  Timestamp? createdAt;
  String? deletedAt;
  bool? status;

  CategoryModel(
      {this.categoryId,
      this.categoryImage,
      this.categoryName,
      this.createdAt,
      this.deletedAt,
      this.status});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryImage = json['category_image'];
    categoryName = json['category_name'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_image'] = this.categoryImage;
    data['category_name'] = this.categoryName;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.deletedAt;
    data['status'] = this.status;
    return data;
  }
}
