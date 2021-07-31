import 'package:events_app/auth/authentication_service.dart';
import 'package:events_app/helpers/screen_nav.dart';
import 'package:events_app/providers/eventProvider.dart';
import 'package:events_app/providers/userProvider.dart';
import 'package:events_app/screens/create_event.dart';
import 'package:events_app/screens/create_society.dart';
import 'package:events_app/screens/loginPage.dart';
import 'package:events_app/screens/profilePage.dart';
import 'package:events_app/widgets/botttomNavBar.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/event_explore.dart';
import 'package:events_app/widgets/event_feed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  final String useremail;
  //for testing purpose only
  bool isfeed = false;

  HomePage({Key? key, required this.useremail}) : super(key: key);

  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.useremail);
    final userProvider = Provider.of<UserProvider>(context);
    final eventprovider = Provider.of<EventProvider>(context);

    userProvider.isuservarified(email: widget.useremail);
    if (userProvider.isvar) {
      print("\n\n\nVarified");
    }
    if (!userProvider.isvar) {
      print("\n\n\n not varified");
    }
    //if (userProvider.isvar) {
    if (userProvider.isvar) {
      userProvider.getVarifiedUser(email: widget.useremail);
    }
    // } else {
    //   print("user not varified");
    // }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomText(
          text: "Events",
          letterspacing: 3,
          fontWeight: FontWeight.bold,
          size: 30,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: CustomText(
                text: "Huzaifashakeel778@gmail.com",
                color: Colors.black,
                size: 16,
              ),
              accountName:
                  CustomText(text: "Huzaifa", color: Colors.black, size: 20),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              onTap: () => {
                // changeScreen(
                //     context,
                //     CreateSociety(
                //       userModel: userProvider.varifiedUser,
                //     ))
              },
            ),
            userProvider.isvar
                ? ListTile(
                    title: Text(
                      "Create Society",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Icon(
                      Icons.food_bank_outlined,
                      size: 35,
                    ),
                    onTap: () => {
                      Navigator.pop(context),
                      changeScreen(
                          context,
                          CreateSociety(
                            userModel: userProvider.varifiedUser,
                          ))
                    },
                  )
                : Divider(
                    thickness: 0,
                  ),
            userProvider.isvar
                ? ListTile(
                    title: Text(
                      "create Event",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Icon(
                      Icons.shopping_cart,
                      size: 35,
                    ),
                    onTap: () => {
                      changeScreen(context,
                          CreateEvent(eventcreator: userProvider.varifiedUser))
                    },
                  )
                : ListTile(
                    title: Text(
                      "Varify Yourself",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Icon(
                      Icons.bookmark_border,
                      size: 35,
                    ),
                    onTap: () => {
                      changeScreen(
                          context, ProfilePage(useremail: widget.useremail))
                    },
                  ),
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.settings,
                size: 35,
              ),
              onTap: () => {},
            ),
            ListTile(
              onTap: () {
                context.read<AuthenticationService>().signOut();
                changeScreenReplacement(context, LoginPage());
              },
              leading: Icon(
                Icons.exit_to_app,
                size: 35,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(active: 1),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: Center(
              //       child: CustomText(
              //     text: "Evnts",
              //     size: 30,
              //     fontWeight: FontWeight.bold,
              //     letterspacing: 5,
              //   )),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Card(
                      elevation: 2,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          )),
                    ),
                    Padding(padding: EdgeInsets.only(left: width * 0.085)),
                    Container(
                      height: height * 0.07,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            color: widget.isfeed
                                ? Colors.white
                                : Colors.grey.shade300,
                            elevation: widget.isfeed ? 2 : 0,
                            child: FlatButton(
                                autofocus: false,
                                onPressed: () {
                                  setState(() {
                                    widget.isfeed = false;
                                  });
                                },
                                child: Text("Explore")),
                          ),
                          Card(
                            elevation: widget.isfeed ? 0 : 2,
                            color: widget.isfeed
                                ? Colors.grey.shade300
                                : Colors.white,
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    widget.isfeed = true;
                                  });
                                },
                                child: Text("Feed")),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: width * 0.1)),
                    Card(
                      elevation: 2,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter_alt,
                            size: 30,
                          )),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                    children: eventprovider.events
                        .map((item) => GestureDetector(
                              child: widget.isfeed
                                  ? EventFeed(
                                      event: item,
                                      useremail: widget.useremail,
                                    )
                                  : EventExp(
                                      event: item,
                                      useremail: widget.useremail,
                                    ),
                            ))
                        .toList()),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     EventExp(image: "images/5.jpg"),
              //     EventExp(
              //       image: "images/4.jpg",
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
