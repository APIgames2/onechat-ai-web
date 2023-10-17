// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isocial/functions/get_posts.dart';

List<dynamic> images = [];
List<Widget> elements = [];

class Search_Page extends StatefulWidget {
  const Search_Page({Key? key}) : super(key: key);

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  Future<void> fetch_images() async {
    final fetchedImages = await search_posts();
    setState(() {
      images = [];
      images = fetchedImages;
      for (var item in images) {
        elements.add(
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(item),
              ),
            ),
          ),
        );
      }
    });
    print("in search page there is : $images");
  }

  @override
  void initState() {
    fetch_images();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: CupertinoSearchTextField(),
                ),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 5,
                    children: elements,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
