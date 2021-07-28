import 'package:events_app/providers/societyProvider.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/society_infoCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ShowUserProfile extends StatefulWidget {
  const ShowUserProfile({Key? key}) : super(key: key);

  @override
  _ShowUserProfileState createState() => _ShowUserProfileState();
}

class _ShowUserProfileState extends State<ShowUserProfile> {
  bool showmore = false;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final socProvider = Provider.of<SocietyProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * 0.32,
                    width: width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                          //                        Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.07),
                        ])),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: height * 0.04)),
                        Center(
                          child: CircleAvatar(
                            radius: 43,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 40,

                              backgroundImage: AssetImage("images/7.jpg"),
                              // radius: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: CustomText(
                            text: "Huzaifa Shakeel",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomText(
                          text: "Minding My Own Business",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          size: 14,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                showmore = !showmore;
                              });
                            },
                            child: CustomText(
                              text: showmore ? "Show less" : "Show More",
                              size: 12,
                            ))
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
                ],
              ),
              showmore
                  ? Container(
                      height: height * 0.35,
                      color: Colors.black54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.layers,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  CustomText(
                                    text: "UET Taxila, CS Department",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 3,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_ic_call,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  CustomText(
                                    text: "0332-4247031",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 3,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.fmd_good_rounded,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  CustomText(
                                    text: "Kot Chutta , Dera Ghazi khan",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 3,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.facebook,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  CustomText(
                                    text: "huzaifashakeel_",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 3,
                          ),
                        ],
                      ),
                    )
                  : Divider(
                      thickness: 0,
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Liked Socities",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: socProvider.socities
                    .map((item) => GestureDetector(
                          onTap: () {},
                          child: SocietyInfoCard(
                            society: item,
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
