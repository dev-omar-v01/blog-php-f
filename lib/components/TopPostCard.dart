import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopPostCard extends StatefulWidget {
  const TopPostCard({super.key});

  @override
  State<TopPostCard> createState() => _TopPostCardState();
}

class _TopPostCardState extends State<TopPostCard> {
  List postData = [];

  Future showAllPost() async {
    var url = "http://192.168.1.106/blog_php_flutter/uploads/postAll.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(await response.body);
      setState(() {
        postData = jsonData;
      });
    }
  }

  void initState() {
    super.initState();
    showAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      //color: Colors.amber,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: postData.length,
          itemBuilder: (context, index) {
            return NewPostItems(
              title: postData[index]['title'],
              author: postData[index]['author'],
              image:
                  'http://192.168.1.106/blog_php_flutter/uploads/${postData[index]['image']}',
              post_date: postData[index]['post_date'],
              comments: postData[index]['comments'],
              total_like: postData[index]['total_like'],
              body: postData[index]['body'],
              category_name: postData[index]['category_name'],
              category_date: postData[index]['category_date'],
            );
          }),
    );
  }
}

class NewPostItems extends StatefulWidget {
  final image;
  final author;
  final post_date;
  final comments;
  final total_like;
  final title;
  final body;
  final category_name;
  final category_date;

  NewPostItems({
    super.key,
    this.image,
    this.author,
    this.post_date,
    this.comments,
    this.total_like,
    this.title,
    this.body,
    this.category_name,
    this.category_date,
  });

  @override
  State<NewPostItems> createState() => _NewPostItemsState();
}

class _NewPostItemsState extends State<NewPostItems> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.amber, Colors.pink])),
          ),
        ),
        Positioned(
            top: 30,
            left: 30,
            child: CircleAvatar(
              radius: 20,
              //child: Icon(Icons.person),
              backgroundImage: NetworkImage(widget.image),
            )),
        Positioned(
            top: 30,
            left: 80,
            child: Text(
              widget.author,
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 30,
            left: 130,
            child: Text(
              widget.post_date,
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 50,
            left: 80,
            child: Icon(Icons.comment,color: Colors.white,size: 20,)),
        Positioned(
            top: 50,
            left: 110,
            child: Text(
              widget.comments,
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 50,
            left: 140,
            child: Icon(Icons.label_important,color: Colors.white,)),
        Positioned(
            top: 50,
            left: 170,
            child:Text(
              widget.total_like,
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 90,
            left: 30,
            child:Text(
              widget.title,
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 148,
            left: 30,
            child:Icon(Icons.arrow_back,color: Colors.white,size: 20 ,)),
        Positioned(
            top: 150,
            left: 55,
            child:InkWell(
              onTap: (){

              },
              child: Text(
                "Read More..",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}
