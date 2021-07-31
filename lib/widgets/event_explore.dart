import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class EventExploreWidget extends StatelessWidget {
  final String image;
  const EventExploreWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
            // child: Stack(
            //   children: [
            //     Container(
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Image.asset(
            //           this.image,
            //           fit: BoxFit.fill,
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            //       child: Chip(
            //         label: Text(
            //           'Online',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         backgroundColor: Colors.black87,
            //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //         visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(130, 90, 0, 0),
            //       child: Container(
            //         height: _height * 0.08,
            //         width: _width * 0.11,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.black),
            //         child: Center(
            //           child: CustomText(
            //             text: "Jul\n 06",
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             size: 15,
            //           ),
            //         ),
            //       ),
            //     )

            // ],
            // ),
            //),
            // ,
            // CustomText(
            //   text: "Musical consert",
            //   fontWeight: FontWeight.bold,
            //   size: 10,
            // ),
            // CustomText(
            //   text: "UET Taxila, CS Department",
            //   size: 10,
            //   fontWeight: FontWeight.w600,
            //   color: Colors.grey,
            // ),
          ],
        ),
      ),
    );
  }
}
