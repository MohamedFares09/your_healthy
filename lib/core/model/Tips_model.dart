import 'package:easy_localization/easy_localization.dart';

class TipsModel {
  final String? postImageUrl;
  final String? postTitle;
  final String? authorName;
  final String? postDate;

  TipsModel({
    this.postImageUrl,
    this.postTitle,
    this.authorName,
    this.postDate,
  });

  factory TipsModel.fromJson(Map<String, dynamic> json) {
    // استخراج بيانات الصورة
    String? imageUrl;
    if (json['_embedded'] != null &&
        json['_embedded']['wp:featuredmedia'] != null &&
        json['_embedded']['wp:featuredmedia'].isNotEmpty) {
      imageUrl = json['_embedded']['wp:featuredmedia'][0]['source_url'];
    }

    // استخراج العنوان
    String? title;
    if (json['title'] != null && json['title']['rendered'] != null) {
      title = json['title']['rendered'];
    }

 
    String? author;
    if (json['_embedded'] != null &&
        json['_embedded']['author'] != null &&
        json['_embedded']['author'] !=null) {
      author = json['_embedded']['author'][0]['name'];
    }

    String? date;
    if (json['date'] != null) {
   
      try {
        DateTime dateTime = DateTime.parse(json['date']);
       
        date = DateFormat('MMMM d, yyyy', 'ar').format(dateTime); 
      } catch (e) {
        print("Error parsing date: $e");
      }
    }

    return TipsModel(
      postImageUrl: imageUrl,
      postTitle: title,
      authorName: author,
      postDate: date,
    );
  }
}