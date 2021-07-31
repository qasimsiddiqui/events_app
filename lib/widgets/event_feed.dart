import 'package:events_app/helpers/screen_nav.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/providers/societyProvider.dart';
import 'package:events_app/providers/userProvider.dart';
import 'package:events_app/screens/eventDetails.dart';
import 'package:events_app/screens/loading.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class EventFeed extends StatefulWidget {
  final EventModel event;
  final String useremail;

  EventFeed({required this.event, required this.useremail});
  @override
  _EventFeedState createState() => _EventFeedState();
}

class _EventFeedState extends State<EventFeed> {
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final userprovider = Provider.of<UserProvider>(context);
    final societyProvider = Provider.of<SocietyProvider>(context);

    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: height * 0.35,
              width: width * 0.93,
              child: Card(
                elevation: 2,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Loading(),
                        GestureDetector(
                          onTap: () async {
                            print(widget.event.hostuid);
                            await userprovider.getuserbyid(
                                id: widget.event.hostuid);

                            await societyProvider.getSocietybyid(
                                id: widget.event.hostsocietyid);
                            if (userprovider.isvar) {
                              await userprovider.getVarifiedUser(
                                  email: widget.useremail);
                            }
                            print("going in event");
                            changeScreen(
                                context,
                                EventDetails(
                                    event: widget.event,
                                    eventhost: userprovider.eventhost,
                                    user: userprovider.varifiedUser,
                                    eventhostSociety:
                                        societyProvider.eventhostsociety));
                          },
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: widget.event.image,
                            // height: 200,
                            fit: BoxFit.fill,
                            // width: double.infinity,

                            height: height * 0.35,
                            width: width * 0.93,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              height: height * 0.06,
              width: width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black),
              child: Center(
                child: CustomText(
                  text: widget.event.isonline ? "Online" : "Onsite",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 15,
                ),
              ),
            ),
            Padding(
              //get screen size and adjust pedding (later)
              padding: const EdgeInsets.fromLTRB(318, 153, 0, 0),
              child: Container(
                height: height * 0.12,
                width: width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black),
                child: Center(
                  child: CustomText(
                    text: "July \n" + widget.event.date.substring(8, 10),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 170, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.event.name,
                    fontWeight: FontWeight.bold,
                    size: 24,
                    color: Colors.white,
                  ),
                  CustomText(
                    text: widget.event.location,
                    fontWeight: FontWeight.w500,
                    size: 18,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: width * 0.05)),
              CircleAvatar(
                  radius: 25, backgroundImage: AssetImage("images/7.jpg")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.event.heldby,
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: widget.event.heldbySociety,
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Card(
                  color: Colors.grey.shade300,
                  elevation: 2,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              likes++;
                            });
                          },
                          icon: Icon(Icons.thumb_up)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$likes"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 2,
        )
      ],
    );
  }
}
