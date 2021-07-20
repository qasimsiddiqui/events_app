import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
  bool isfeed = false;
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
      body: SafeArea(
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
            // Padding(padding: EdgeInsets.only(top: 10)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Card(
                    elevation: 2,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.all(Radius.circular(20)),
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.grey,
                    //       blurRadius: 2.0,
                    //       spreadRadius: 0.0,
                    //       offset: Offset(
                    //           2.0, 2.0), // shadow direction: bottom right
                    //     )
                    //   ],
                    // ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 30,
                        )),
                  ),
                  Padding(padding: EdgeInsets.only(left: width * 0.1)),
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
                          elevation: widget.isfeed ? 2 : 0,
                          child: FlatButton(
                              onPressed: () {}, child: Text("Explore")),
                        ),
                        FlatButton(onPressed: () {}, child: Text("Feed")),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: width * 0.08)),
                  Card(
                    elevation: 2,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.all(Radius.circular(20)),
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.grey,
                    //       blurRadius: 2.0,
                    //       spreadRadius: 0.0,
                    //       offset: Offset(
                    //           2.0, 2.0), // shadow direction: bottom right
                    //     )
                    //   ],
                    // ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_1,
                          size: 30,
                        )),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.3,
                      width: width * 0.45,
                      child: Card(
                        elevation: 2,
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "images/5.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black),
                        child: Center(
                          child: CustomText(
                            text: "Online",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(130, 135, 0, 0),
                      child: Container(
                        height: height * 0.1,
                        width: width * 0.12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black),
                        child: Center(
                          child: CustomText(
                            text: "July \n 06",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                CustomText(
                  text: "Musical consert",
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: "At UET Taxila CS Department",
                  fontWeight: FontWeight.w500,
                  size: 13,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
