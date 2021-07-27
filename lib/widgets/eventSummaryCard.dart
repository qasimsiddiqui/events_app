import 'package:events_app/models/event.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class EventSummaryCard extends StatelessWidget {
  final EventModel event;

  const EventSummaryCard({required this.event});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * 0.13,
          width: width * 0.9,
          child: Card(
            // color: Colors.amber,
            elevation: 2,
            child: Row(
              children: [
                Container(
                  height: height * 0.12,
                  width: width * 0.19,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Card(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 10)),
                          CustomText(
                            text: "JULY",
                            color: Colors.white,
                          ),
                          CustomText(
                            text: event.date.substring(8, 10),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Container(
                  width: width * 0.43,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5)),
                      CustomText(
                        text: event.name,
                        size: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: event.startime + " to" + event.endtime,
                        size: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      CustomText(
                        text: event.location,
                        size: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                    child: Container(
                        // height: height * 0.1,
                        width: width * 0.18,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: FlatButton(
                              color: Colors.black,
                              child: CustomText(
                                  text: "Save",
                                  color: Colors.white,
                                  size: 14,
                                  fontWeight: FontWeight.bold),
                              onPressed: () {},
                            )))),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
