// ignore_for_file: file_names

class TipsModel {
  final String postImageUrl;
  final String postTitle;
  final String authorName;
  final String postDate;
  final String postContent;


  TipsModel({
  required this.postImageUrl ,
  required this.postTitle ,
  required this.authorName ,
  required this.postDate ,
  required this.postContent,
  
  });

  factory TipsModel.fromJson(Map<String, dynamic> json) {
    return TipsModel(
      postContent: json['content']['rendered'],
      postTitle: json['title']['rendered'],
      authorName:  json['_embedded']['author'][0]['name'],
      postDate:  json['modified'],
      postImageUrl:json['_embedded']['wp:featuredmedia'][0]['source_url']
    );
  }
}