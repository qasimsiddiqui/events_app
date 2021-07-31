import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/eventFeed_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //for testing purpose only
  bool isfeed = false;
  List<String> mylist = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg"
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(
                text: "Events",
                size: 20,
                fontWeight: FontWeight.bold,
                letterspacing: 5,
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: mylist
                    .map((e) => GestureDetector(
                          onTap: () {},
                          child: EventFeed(image: e),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
