
class Data{
  final String loSignedUrl;
  final String title;
  final String language;
  final List keywords;
  final String transcript;
  final String summary25;
  final String summary50;
  final String summary75;

  Data({this.loSignedUrl, this.title, this.language, this.keywords, this.transcript, this.summary25, this.summary50, this.summary75});

   factory Data.fromJson(Map<dynamic, dynamic> json) {
    return Data(
      loSignedUrl: json['loSignedUrl'],
      title: json['title'],
      language: json['title'],
      keywords: json['keywords'],
      transcript: json['transcript'],
      summary25: json['summary25'],
      summary50: json['summary50'],
      summary75: json['summary75'],
    );
  }



}
