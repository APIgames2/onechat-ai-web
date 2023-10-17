import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:isocial/components/You_are_uptodate.dart';
import 'package:isocial/functions/get_posts.dart';

List<Widget> items = [];

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    DatabaseReference update = FirebaseDatabase.instance.ref("trends");
    update.onValue.listen((event) async {
      final fetchedItems = await get_posts();
      if (mounted) {
        setState(() {
          items = [];
          items = fetchedItems;
          items.add(const You_Are_UpToDate());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          height: double.infinity,
          scrollDirection: Axis.vertical,
        ),
        items: items,
      ),
    ));
  }
}
