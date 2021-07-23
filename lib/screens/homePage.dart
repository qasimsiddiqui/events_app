import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/event_explore.dart';
import 'package:events_app/widgets/event_feed.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                    child: CustomText(
                  text: "Events",
                  size: 30,
                  fontWeight: FontWeight.bold,
                  letterspacing: 5,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Card(
                      elevation: 2,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          )),
                    ),
                    Padding(padding: EdgeInsets.only(left: width * 0.085)),
                    Container(
                      height: height * 0.07,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            color: isfeed ? Colors.grey.shade300 : Colors.white,
                            elevation: isfeed ? 0 : 2,
                            child: TextButton(
                                autofocus: false,
                                onPressed: () {
                                  setState(() {
                                    isfeed = false;
                                  });
                                },
                                child: Text("Explore")),
                          ),
                          Card(
                            elevation: isfeed ? 2 : 0,
                            color: isfeed ? Colors.white : Colors.grey.shade300,
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isfeed = true;
                                  });
                                },
                                child: Text("Feed")),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: width * 0.1)),
                    Card(
                      elevation: 2,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: isfeed
                    ? Column(
                        children: mylist
                            .map((e) => GestureDetector(
                                  onTap: () {},
                                  child: EventFeed(image: e),
                                ))
                            .toList(),
                      )
                    : GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisSpacing: 5.0,
                        crossAxisCount: 2,
                        children: mylist
                            .map((item) => GestureDetector(
                                  onTap: () {},
                                  child: isfeed
                                      ? EventFeed(
                                          image: item,
                                        )
                                      : EventExp(image: item),
                                ))
                            .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
