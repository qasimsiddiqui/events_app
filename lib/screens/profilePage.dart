import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Stack(children: [
                Container(
                  width: double.maxFinite,
                  height: _size.height * 0.40,
                  color: Colors.red,
                  child: Image.asset(
                    'images/2.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  child: Container(
                    width: double.maxFinite,
                    height: _size.height * 0.40,
                    color: Colors.black.withOpacity(0.5),
                  ),
                )
              ]),
              Padding(
                padding: EdgeInsets.only(top: _size.height * 0.07, left: 10),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.white)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ))),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.15),
                  child: Column(
                    children: [
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: DottedBorder(
                            dashPattern: [6, 6],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            strokeWidth: 2,
                            color: Colors.white,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: 'Change Image',
                          color: Colors.white,
                          size: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.30),
                  child: Container(
                    height: _size.width * 0.35,
                    width: _size.width * 0.35,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new ExactAssetImage('images/7.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: DottedBorder(
                              dashPattern: [6, 6],
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10),
                              strokeWidth: 2,
                              color: Colors.white,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: 'Change Image',
                            color: Colors.white,
                            size: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
              child: Text('Name', style: Theme.of(context).textTheme.bodyText1),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Your Name',
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
              child: Text('Bio', style: Theme.of(context).textTheme.bodyText1),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Add an Exciting Bio',
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder()),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
              child: Text('City', style: Theme.of(context).textTheme.bodyText1),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter your City',
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
              child: Text('University', style: Theme.of(context).textTheme.bodyText1),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Select your University',
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
