import 'package:blog_api/models/blog_post.dart';
import 'package:blog_api/screens/post_details.dart';
import 'package:blog_api/services/blog_post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Posts>> futurePosts;
  @override
  void initState() {
    super.initState();
    futurePosts = fetchPost();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch data from our api"),
      ),
      body: FutureBuilder<List<Posts>>(
        future: futurePosts,
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            return ListView.builder(
              itemCount: snapchot.data!.length,
              itemBuilder: (_, index) => Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('${snapchot.data![index].title}'),
                      trailing: Icon(Icons.favorite_outline),
                    ),
                    Container(
                      height: 200.0,
                      child: Image.network(
                          "${snapchot.data![index].featuredImageUrl}"),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(16.0),
                    //   alignment: Alignment.centerLeft,
                    //   child: Html(data:'${snapchot.data![index].details}',style: Over,),
                    // ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        DateFormat("dd-MMM-yyyy").format(
                          DateTime.parse(snapchot.data![index].date),
                        ),
                        style: TextStyle(backgroundColor: Colors.grey),
                      ),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          child: Text(
                            '${snapchot.data![index].category}',
                          ),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text('Read More'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostDetails(
                                          blogPost: snapchot.data![index],
                                        )));
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
