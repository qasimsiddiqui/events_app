import 'package:events_app/models/user.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MemberInfo extends StatelessWidget {
  final UserModel user;
  MemberInfo({required this.user});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.13,
      width: width * 0.85,
      child: Card(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: width * 0.03)),
            CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage, image: user.profileimage),
              radius: 33,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomText(
                    text: user.name,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: user.university + " ," + user.department,
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
