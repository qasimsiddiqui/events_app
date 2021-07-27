import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class SocietyInfo extends StatelessWidget {
  const SocietyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, top: 10, bottom: 10),
          child: Row(
            children: [
              CustomText(
                text: "Afiliated to",
                fontWeight: FontWeight.w500,
                size: 18,
              ),
            ],
          ),
        ),
        Container(
          height: height * 0.12,
          width: width * 0.8,
          //color: Colors.white,
          //  child: Card(
          //  elevation: 2,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 0)),
              CircleAvatar(
                backgroundImage: AssetImage("images/9.jpg"),
                radius: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: height * 0.015)),
                  CustomText(
                    text: "UET Taxila",
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                  CustomText(
                    text: "Civil Department",
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    size: 16,
                  ),
                ],
              )
            ],
          ),
          //),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, top: 10, bottom: 10),
          child: Row(
            children: [
              CustomText(
                text: "Joining Date",
                fontWeight: FontWeight.w500,
                size: 18,
              ),
            ],
          ),
        ),
        Container(
            height: height * 0.05,
            width: width * 0.8,
            // color: Colors.white,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 5)),
                CustomText(
                  text: "18-12-2020 , 12:00 pm",
                  color: Colors.black54,
                  size: 16,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(left: 35, top: 10, bottom: 10),
          child: Row(
            children: [
              CustomText(
                text: "Our Goals",
                fontWeight: FontWeight.w500,
                size: 18,
              ),
            ],
          ),
        ),
        Container(
            height: height * 0.3,
            width: width * 0.8,
            // color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. When an unknown printer took a galley of type and scrambled it to make a type specimen book",
                    color: Colors.black54,
                    size: 16,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
