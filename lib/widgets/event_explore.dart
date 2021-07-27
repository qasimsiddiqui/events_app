import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class EventExp extends StatelessWidget {
  final String image;
  const EventExp({required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  height: width * 0.45,
                  width: width * 0.45,
                  child: Card(
                    elevation: 2,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          this.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Container(
                    height: height * 0.04,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.black),
                    child: Center(
                      child: CustomText(
                        text: "Online",
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(130, 90, 0, 0),
                  child: Container(
                    height: height * 0.08,
                    width: width * 0.11,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.black),
                    child: Center(
                      child: CustomText(
                        text: "Jul\n 06",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomText(
            text: "Musical consert",
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: "UET Taxila, CS Department",
            size: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}