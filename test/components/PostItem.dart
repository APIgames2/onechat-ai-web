import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

var name = "ereur";
var image;

class Post_Item extends StatefulWidget {
  const Post_Item({Key? key, required this.post}) : super(key: key);
  final post;

  @override
  State<Post_Item> createState() => _Post_ItemState();
}

class _Post_ItemState extends State<Post_Item> {
  @override
  Widget build(BuildContext context) {
    var _isMobile = MediaQuery.of(context).size.width < 1000;
    if (widget.post == null ||
        widget.post["images"] == null ||
        widget.post["images"]["url"] == null) {
      return const CupertinoActivityIndicator();
    }

    if (_isMobile) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.post["images"]["url"]),
          ),
        ),
        child: Content(
          post: widget.post,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.post["images"]["url"]),
            ),
          ),
          child: Content(
            post: widget.post,
          ),
        ),
      );
    }
  }
}

class Content extends StatefulWidget {
  const Content({super.key, required this.post});
  final post;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Future<void> fetchName() async {
    final ref = FirebaseDatabase.instance.ref();
    ref.child(widget.post["founder"]).onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null && data is Map<dynamic, dynamic>) {
        setState(() {
          name = "@${data["name"] as String}";
          image = "@${data["image"] as String}";
        });
      } else {
        if (kDebugMode) {
          print('No data available.');
        }
      }
    });
  }

  @override
  void initState() {
    fetchName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Center(
          child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(name,
                    style: const TextStyle(color: CupertinoColors.white)),
                Text(
                  widget.post["images"]["name"],
                  style: const TextStyle(color: CupertinoColors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: 60,
                    height: 60,
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                                width: 45,
                                height: 45,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(99),
                                  child: Image.network(
                                    "https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ))),
                      ],
                    )),
                SizedBox(
                    width: 60,
                    height: 80,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            CupertinoIcons.heart_solid,
                            color: CupertinoColors.white,
                            size: 45,
                          ),
                        ),
                        Text(
                          "${widget.post["likes"]}",
                          style: TextStyle(color: CupertinoColors.white),
                        )
                      ],
                    )),
                SizedBox(
                    width: 60,
                    height: 80,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            CupertinoIcons.chat_bubble_fill,
                            color: CupertinoColors.white,
                            size: 45,
                          ),
                        ),
                        Text(
                          "${(widget.post["comments"] as List<dynamic>).length}",
                          style: TextStyle(color: CupertinoColors.white),
                        )
                      ],
                    )),
                SizedBox(
                    width: 60,
                    height: 80,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            CupertinoIcons.arrow_turn_up_right,
                            color: CupertinoColors.white,
                            size: 45,
                          ),
                        ),
                        Text(
                          "${widget.post["share"]}",
                          style: TextStyle(color: CupertinoColors.white),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
