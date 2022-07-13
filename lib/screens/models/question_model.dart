import 'package:flutter/cupertino.dart';

class QuestionModel {
  String? questionOne;
  String? questionTwo;
  String? questionThree;
  List<String>? questionFour;
  bool? isSelected = false;
  String? type;
  String? image;

  QuestionModel(
      {this.questionOne,
      this.questionTwo,
      this.questionThree,
      this.isSelected,
      this.type,
      this.image,
      this.questionFour});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    questionOne = json['questionOne'];
    questionTwo = json['questionTwo'];
    questionThree = json['questionThree'];
    questionFour = json['questionFour'];
    isSelected = json['isSelected'];
    type = json['type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionOne'] = this.questionOne;
    data['questionTwo'] = this.questionTwo;
    data['questionThree'] = this.questionThree;
    data['questionFour'] = this.questionFour;
    data['type'] = this.type;
    data['image'] = this.image;
    return data;
  }
}
