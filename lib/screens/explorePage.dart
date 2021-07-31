import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/eventExplore_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<String> mylist = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg",
    "images/7.jpg",
    "images/8.jpg",
    "images/9.jpg"
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomText(
            text: "Explore",
            size: 20,
            fontWeight: FontWeight.bold,
            letterspacing: 5,
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CupertinoSearchTextField(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                childAspectRatio: (_width * 0.45) / (_width * 0.61),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                physics: ScrollPhysics(),
                children: mylist.map((item) => EventExploreWidget(image: item)).toList()),
          ),
        ),
      ])),
    );
  }
}
