// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

List<QuestionModel> questionModelFromJson(String str) =>
    List<QuestionModel>.from(
        json.decode(str).map((x) => QuestionModel.fromJson(x)));

String questionModelToJson(List<QuestionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel {
  QuestionModel({
    required this.question,
    this.optionA,
    this.optionB,
    this.optionC,
    this.optionD,
    required this.answer,
    required this.correctOption,
  });

  String question;
  dynamic optionA;
  dynamic optionB;
  dynamic optionC;
  dynamic optionD;
  String answer;
  String correctOption;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        question: json["question"],
        optionA: json["option_a"],
        optionB: json["option_b"],
        optionC: json["option_c"],
        optionD: json["option_d"],
        answer: json["answer"],
        correctOption: json["correct_option"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "option_a": optionA,
        "option_b": optionB,
        "option_c": optionC,
        "option_d": optionD,
        "answer": answer,
        "correct_option": correctOption,
      };
}
