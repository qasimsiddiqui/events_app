import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/event_explore.dart';
import 'package:events_app/widgets/event_feed.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
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
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                            color: widget.isfeed
                                ? Colors.white
                                : Colors.grey.shade300,
                            elevation: widget.isfeed ? 2 : 0,
                            child: FlatButton(
                                autofocus: false,
                                onPressed: () {
                                  setState(() {
                                    widget.isfeed = false;
                                  });
                                },
                                child: Text("Explore")),
                          ),
                          Card(
                            elevation: widget.isfeed ? 0 : 2,
                            color: widget.isfeed
                                ? Colors.grey.shade300
                                : Colors.white,
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    widget.isfeed = true;
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
                            Icons.filter_alt,
                            size: 30,
                          )),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                    children: widget.mylist
                        .map((item) => GestureDetector(
                              onTap: () {},
                              child: widget.isfeed
                                  ? EventFeed(
                                      image: item,
                                    )
                                  : EventExp(image: item),
                            ))
                        .toList()),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     EventExp(image: "images/5.jpg"),
              //     EventExp(
              //       image: "images/4.jpg",
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
