import 'dart:convert';

List<Lesson> lessonsFromJson(String str) => List<Lesson>.from(json.decode(str).map((x) => Lesson.fromJson(x)));


class Lesson {
  Lesson({
    this.lessonCode,
    this.title,
    this.sectionNo,
    this.orderNo,
    this.llos,
    this.courseCode,
    this.intakeNo,
    this.cognitive,
    this.depth,
    this.courseCodeIntakeNoLessonCode,
  });

  String lessonCode;
  String title;
  int sectionNo;
  int orderNo;
  List<Llo> llos;
  String courseCode;
  int intakeNo;
  String cognitive;
  int depth;
  String courseCodeIntakeNoLessonCode;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    lessonCode: json["lessonCode"],
    title: json["title"],
    sectionNo: json["sectionNo"],
    orderNo: json["orderNo"],
    llos: List<Llo>.from(json["llos"].map((x) => Llo.fromJson(x))),
    courseCode: json["courseCode"],
    intakeNo: json["intakeNo"],
    cognitive: json["cognitive"],
    depth: json["depth"],
    courseCodeIntakeNoLessonCode: json["courseCode_intakeNo_lessonCode"],
  );

}

class Llo {
  Llo({
    this.usingRole,
    this.syllabus,
    this.conceptId,
    this.conceptName,
    this.cognitive,
    this.depth,
  });

  List<String> usingRole;
  List<Syllabus> syllabus;
  String conceptId;
  String conceptName;
  String cognitive;
  int depth;

  factory Llo.fromJson(Map<String, dynamic> json) => Llo(
    usingRole: List<String>.from(json["usingRole"].map((x) => x)),
    syllabus: List<Syllabus>.from(json["syllabus"].map((x) => Syllabus.fromJson(x))),
    conceptId: json["conceptId"],
    conceptName: json["conceptName"],
    cognitive: json["cognitive"],
    depth: json["depth"],
  );

}

class Syllabus {
  Syllabus({
    this.toc,
    this.subConceptId,
    this.subConceptName,
    this.verb,
  });

  List<dynamic> toc;
  String subConceptId;
  String subConceptName;
  String verb;

  factory Syllabus.fromJson(Map<String, dynamic> json) => Syllabus(
    toc: List<dynamic>.from(json["toc"].map((x) => x)),
    subConceptId: json["subConceptId"],
    subConceptName: json["subConceptName"],
    verb: json["verb"],
  );
}
