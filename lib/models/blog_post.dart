import 'dart:convert';

class BlogPost {
  late int id;
  late String title;
  late String details;
  late String featuredImageUrl;
  late String category;
  late String date;

}


List<Posts> postFromJSON(String str)=>List<Posts>.from(json.decode(str).map((x)=>Posts.fromMap(x)));


class Posts{
  Posts({
    required this.id,
    required this.title,
    required this.details,
    required this.featuredImageUrl,
    required this.category,
    required this.date,

  });

  int id;
  String title;
  String details;
  String featuredImageUrl;
  String category;
  String date;
  factory Posts.fromMap(Map<String,dynamic> json)=>Posts(
    id: json["id"],
    title: json['title'],
    details: json['details'],
    featuredImageUrl: json['featured_image_url'],
    category: json['category']['name'],
    date: json['created_at'],
  );
}





