import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: _height * 0.45,
                width: _width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.07),
                    ])),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: _height * 0.1)),
                    Center(
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 52,
                          backgroundImage: AssetImage("images/7.jpg"),
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(30),
                          //   child: Stack(
                          //     children: [
                          //       Loading(),
                          //       FadeInImage.memoryNetwork(
                          //           fit: BoxFit.fill,
                          //           height: height * 0.15,
                          //           placeholder: kTransparentImage,
                          //           image: widget.userModel.profileimage),
                          //     ],
                          //   ),
                          // ),
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
                      text: "Minding My own Business",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      size: 14,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(_width * 0.2, _height * 0.15, 0, 0),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("images/callicon.png"),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(30),
                    //   child: Stack(
                    //     children: [
                    //       Loading(),
                    //       FadeInImage.memoryNetwork(
                    //           fit: BoxFit.fill,
                    //           height: height * 0.15,
                    //           placeholder: kTransparentImage,
                    //           image: widget.userModel.profileimage),
                    //     ],
                    //   ),
                    // ),
                    // radius: 40,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(_width * 0.7, _height * 0.15, 0, 0),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("images/msgicon.png"),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(30),
                    //   child: Stack(
                    //     children: [
                    //       Loading(),
                    //       FadeInImage.memoryNetwork(
                    //           fit: BoxFit.fill,
                    //           height: height * 0.15,
                    //           placeholder: kTransparentImage,
                    //           image: widget.userModel.profileimage),
                    //     ],
                    //   ),
                    // ),
                    // radius: 40,
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Padding(
                padding: EdgeInsets.only(top: _height * 0.37),
                child: Material(
                  elevation: 2,
                  child: Container(
                    height: _height * 0.51,
                    width: _width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Expanded(
                      child: ListView(
                        children: [Text("kjshjkdaks")],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
