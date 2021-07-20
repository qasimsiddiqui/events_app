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
      child: Row(
        children: [
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
                            this.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
          ),

          ///finding a way to make this column appera
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
                            this.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
          ),
        ],
      ),
    );
  }
}
