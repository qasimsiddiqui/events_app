import 'dart:ui';

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
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: _height * 0.35,
                  width: _width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                      image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover)),
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                    child: Container(
                      width: _width * 0.95,
                      height: _height * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: _height * 0.35,
                  width: _width * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Chip(
                            label: Text(
                              'Online',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black87,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                      Padding(
                        //get screen size and adjust pedding (later)
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: _height * 0.10,
                            width: _width * 0.16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.black87),
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
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Musical consert",
                        fontWeight: FontWeight.bold,
                        size: 17,
                        color: Colors.white,
                      ),
                      CustomText(
                        text: "At UET Taxila CS Department",
                        fontWeight: FontWeight.normal,
                        size: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("images/7.jpg")),
              title: Text(
                'Huzaifa Shakeel',
              ),
              subtitle: Text(
                'Comptech Head',
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    likes++;
                  });
                },
                child: Container(
                  width: 60,
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$likes"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
