import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));


class Video {
  Video({
    this.loSignedUrl,
    this.title,
    this.language,
    this.keywords,
    this.transcript,
    this.summary25,
    this.summary50,
    this.summary75,
    this.vttSignedUrl,
    this.audioList,
  });

  String loSignedUrl;
  String title;
  String language;
  List<Keyword> keywords;
  String transcript;
  String summary25;
  String summary50;
  String summary75;
  String vttSignedUrl;
  List<dynamic> audioList;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    loSignedUrl: json["loSignedUrl"],
    title: json["title"],
    language: json["language"],
    keywords: List<Keyword>.from(json["keywords"].map((x) => Keyword.fromJson(x))),
    transcript: json["transcript"],
    summary25: json["summary25"],
    summary50: json["summary50"],
    summary75: json["summary75"],
    vttSignedUrl: json["vttSignedUrl"],
    audioList: List<dynamic>.from(json["audioList"].map((x) => x)),
  );

}

class Keyword {
  Keyword({
    this.id,
    this.word,
    this.youtubeLink,
    this.wikipediaLink,
  });

  String id;
  String word;
  String youtubeLink;
  String wikipediaLink;

  factory Keyword.fromJson(Map<String, dynamic> json) => Keyword(
    id: json["id"],
    word: json["word"],
    youtubeLink: json["youtubeLink"],
    wikipediaLink: json["wikipediaLink"],
  );


}