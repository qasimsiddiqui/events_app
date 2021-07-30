import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class EventFeed extends StatefulWidget {
  final String image;

  EventFeed({required this.image});
  @override
  _EventFeedState createState() => _EventFeedState();
}

class _EventFeedState extends State<EventFeed> {
  int likes = 0;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.35,
                  width: width * 0.8,
                  child: Card(
                    elevation: 2,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  height: height * 0.06,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.black),
                  child: Center(
                    child: CustomText(
                      text: "Online",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 15,
                    ),
                  ),
                ),
                Padding(
                  //get screen size and adjust pedding (later)
                  padding: const EdgeInsets.fromLTRB(250, 150, 0, 0),
                  child: Container(
                    height: height * 0.12,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.black),
                    child: Center(
                      child: CustomText(
                        text: "July \n 06",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 170, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Musical consert",
                        fontWeight: FontWeight.bold,
                        size: 24,
                        color: Colors.white,
                      ),
                      CustomText(
                        text: "At UET Taxila CS Department",
                        fontWeight: FontWeight.w500,
                        size: 15,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Row(
                children: [
                  CircleAvatar(radius: 25, backgroundImage: AssetImage("images/7.jpg")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Huzaifa Shakeel',
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'Comptech Head',
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Card(
                      color: Colors.grey.shade300,
                      elevation: 2,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  likes++;
                                });
                              },
                              icon: Icon(Icons.thumb_up)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("$likes"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            )
          ],
        ),
      ],
    );
  }
}
