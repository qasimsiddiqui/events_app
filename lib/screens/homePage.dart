import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/eventFeed_widget.dart';
import 'package:events_app/auth/authentication_service.dart';
import 'package:events_app/helpers/screen_nav.dart';
import 'package:events_app/providers/eventProvider.dart';
import 'package:events_app/providers/userProvider.dart';
import 'package:events_app/screens/create_society.dart';
import 'package:events_app/screens/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  final User user;
  //for testing purpose only
  bool isfeed = false;

  HomePage({required this.user});
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
    print(widget.user.email);
    final userProvider = Provider.of<UserProvider>(context);
    final eventprovider = Provider.of<EventProvider>(context);

    userProvider.isuservarified(email: widget.user.email.toString());

    if (userProvider.isvar) {
      userProvider.getVarifiedUser(email: widget.user.email.toString());
    } else {
      print("user not varified");
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage, image: userProvider.varifiedUser.profileimage),
              accountEmail: CustomText(
                text: "Huzaifashakeel778@gmail.com",
                color: Colors.black,
                size: 16,
              ),
              accountName: CustomText(text: "Huzaifa", color: Colors.black, size: 20),
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
                changeScreen(
                    context,
                    CreateSociety(
                      user: widget.user,
                      userModel: userProvider.varifiedUser,
                    ))
              },
            ),
            ListTile(
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
                      user: widget.user,
                      userModel: userProvider.varifiedUser,
                    ))
              },
            ),
            ListTile(
              title: Text(
                "create Event",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.shopping_cart,
                size: 35,
              ),
              onTap: () => {},
            ),
            ListTile(
              title: Text(
                "My orders",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.bookmark_border,
                size: 35,
              ),
              onTap: () => {},
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(
                text: "Events",
                size: 20,
                fontWeight: FontWeight.bold,
                letterspacing: 5,
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: eventprovider.events
                    .map((e) => GestureDetector(
                          onTap: () {},
                          child: EventFeed(image: e.image),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
