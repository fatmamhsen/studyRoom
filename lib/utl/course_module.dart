import 'dart:convert';

List<Course> coursesFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

class Course {
  Course({
    this.courseCode,
    this.intakeNo,
    this.title,
    this.image,
  });

  String courseCode;
  int intakeNo;
  String title;
  String image;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
      courseCode: json["courseCode"]  ,
      intakeNo: json["intakeNo"] ,
      title: json["title"] ,
      image: json["image"]
  );


}