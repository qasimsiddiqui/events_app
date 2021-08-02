import 'package:flutter/material.dart';

class EventExploreWidget extends StatelessWidget {
  final String image;
  const EventExploreWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 2,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: _height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  color: Colors.amber,
                  image: DecorationImage(image: AssetImage(this.image), fit: BoxFit.cover)),
              child: Padding(
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
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 5, right: 5),
              title: Text("Musical consert"),
              dense: true,
              isThreeLine: true,
              subtitle: Text(
                "UET Taxila, CS Department",
              ),
            )
          ],
        ),
      ),
    );
  }
}
