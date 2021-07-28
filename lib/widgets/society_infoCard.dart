import 'package:events_app/models/society.dart';
import 'package:events_app/models/user.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SocietyInfoCard extends StatelessWidget {
  final SocietyModel society;
  SocietyInfoCard({required this.society});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.13,
      width: width * 0.95,
      child: Card(
        color: Colors.white,
        elevation: 02,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: width * 0.03)),
            CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              backgroundImage: AssetImage("images/11.png"),
              // child: FadeInImage.memoryNetwork(
              //     placeholder: kTransparentImage, image: user.profileimage),
              radius: 33,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: society.name,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: society.university + " ," + society.department,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    size: 14,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
