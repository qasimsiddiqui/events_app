import 'package:events_app/providers/userProvider.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/member_infoCard.dart';
import 'package:events_app/widgets/societyEventDetails.dart';
import 'package:events_app/widgets/society_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocietyDetails extends StatefulWidget {
  const SocietyDetails({Key? key}) : super(key: key);

  @override
  _SocietyDetailsState createState() => _SocietyDetailsState();
}

class _SocietyDetailsState extends State<SocietyDetails> {
  bool isinfopage = false;
  bool showSocietyEvents = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final userProvider = Provider.of<UserProvider>(context);

    Widget isInfoOrMember() {
      if (isinfopage) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: userProvider.users
              .map((item) => GestureDetector(
                    onTap: () {},
                    child: MemberInfo(user: item),
                  ))
              .toList(),
        );
      } else {
        return SocietyInfo();
      }
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.3,
                      width: width * 0.93,
                      child: Card(
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          child: Image(
                            image: AssetImage("images/8.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(140, 150, 0, 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/11.png"),
                        radius: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(320, 140, 0, 0),
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      //  child: Card(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      //     ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                  child: CustomText(
                    text: "Society Name",
                    fontWeight: FontWeight.w700,
                    size: 22,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
                  child: CustomText(
                    text: "(Educational)",
                    fontWeight: FontWeight.w700,
                    size: 18,
                  ),
                ),
                Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        color: showSocietyEvents
                            ? Colors.white
                            : isinfopage
                                ? Colors.white
                                : Colors.grey.shade300,
                        elevation: showSocietyEvents
                            ? 2
                            : isinfopage
                                ? 2
                                : 0,
                        child: TextButton(
                            autofocus: false,
                            onPressed: () {
                              setState(() {
                                isinfopage = false;
                                showSocietyEvents = false;
                              });
                            },
                            child: Text("Info")),
                      ),
                      Card(
                        elevation: showSocietyEvents
                            ? 2
                            : isinfopage
                                ? 0
                                : 2,
                        color: showSocietyEvents
                            ? Colors.white
                            : isinfopage
                                ? Colors.grey.shade300
                                : Colors.white,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                showSocietyEvents = false;
                                isinfopage = true;
                              });
                            },
                            child: Text("Members")),
                      ),
                      Card(
                        elevation: showSocietyEvents ? 0 : 2,
                        color: showSocietyEvents ? Colors.grey.shade300 : Colors.white,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                ///isinfopage = false;
                                showSocietyEvents = true;
                                print(showSocietyEvents);
                              });
                            },
                            child: Text("Events")),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                showSocietyEvents ? SocietyEventDetails() : isInfoOrMember()
                //MemberInfo()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
