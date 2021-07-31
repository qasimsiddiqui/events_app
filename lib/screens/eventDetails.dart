import 'package:events_app/helpers/screen_nav.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/models/society.dart';
import 'package:events_app/models/user.dart';
import 'package:events_app/providers/eventProvider.dart';
import 'package:events_app/providers/userProvider.dart';
import 'package:events_app/screens/loading.dart';
import 'package:events_app/screens/showUserProfile.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/eventSummaryCard.dart';
import 'package:events_app/widgets/member_infoCard.dart';
import 'package:events_app/widgets/society_infoCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class EventDetails extends StatelessWidget {
  final EventModel event;
  final UserModel eventhost;
  final UserModel user;
  final SocietyModel eventhostSociety;

  const EventDetails(
      {Key? key,
      required this.event,
      required this.eventhost,
      required this.user,
      required this.eventhostSociety})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final userprovider = Provider.of<UserProvider>(context);

    final eventprovider = Provider.of<EventProvider>(context);
    print("Printing user\n\n\n");
    print(user);

    //just for testing
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * 0.35,
                    width: width,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Stack(
                          children: [
                            Loading(),
                            FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: event.image,
                              fit: BoxFit.fill,
                              height: height * 0.35,
                              width: width,
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Container(
                          height: height * 0.07,
                          width: width * 0.1,
                          child: IconButton(
                            icon: Icon(Icons.not_interested),
                            onPressed: () async {
                              print("event uid");
                              print(event.uid);
                              await eventprovider.createEventMem(
                                  user, event.uid);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
                    child: EventSummaryCard(
                      event: event,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomText(
                      text: "About",
                      fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: CustomText(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. When an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      fontWeight: FontWeight.w700,
                      size: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomText(
                      text: "Host Society",
                      fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                  ),
                ],
              ),
              SocietyInfoCard(
                society: eventhostSociety,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomText(
                      text: "Host",
                      fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    changeScreen(
                        context, ShowUserProfile(userModel: eventhost));
                  },
                  child: MemberInfo(user: eventhost)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomText(
                      text: "Who's Going ?",
                      fontWeight: FontWeight.bold,
                      size: 16,
                    ),
                  ),
                ],
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userprovider.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 0),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: userprovider.users[index].profileimage,
                            ),
                          ),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
