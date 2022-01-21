import 'package:blog_api/models/blog_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

class PostDetails extends StatefulWidget {
  final Posts blogPost;
  const PostDetails({Key? key, required this.blogPost}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.blogPost.title),
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.network(
                    this.widget.blogPost.featuredImageUrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    this.widget.blogPost.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    DateFormat("dd-MMM-yyyy").format(
                      DateTime.parse(this.widget.blogPost.date),
                    ),
                    style: TextStyle(backgroundColor: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Html(
                    data:this.widget.blogPost.details,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
