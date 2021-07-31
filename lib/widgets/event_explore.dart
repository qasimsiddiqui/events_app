import 'package:events_app/helpers/screen_nav.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/providers/societyProvider.dart';
import 'package:events_app/providers/userProvider.dart';
import 'package:events_app/screens/eventDetails.dart';
import 'package:events_app/screens/loading.dart';
import 'package:events_app/screens/showUserProfile.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class EventExp extends StatelessWidget {
  final EventModel event;
  final String useremail;
  const EventExp({required this.event, required this.useremail});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final userprovider = Provider.of<UserProvider>(context);
    final societyProvider = Provider.of<SocietyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, width * 0.4, height * 0.01),
            child: Container(
                height: height * 0.09,
                width: width * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.black12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage("images/7.jpg")),

                      //  FadeInImage.memoryNetwork(
                      //   placeholder: kTransparentImage,
                      //   image: event.image,
                      //   // height: 200,
                      //   fit: BoxFit.fill,
                      //   // width: double.infinity,
                      // ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            CustomText(
                              text: "Host",
                              size: 14,
                              color: Colors.black,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await userprovider.getuserbyid(
                                    id: event.hostuid);
                                print(userprovider.eventhost);
                                changeScreen(
                                    context,
                                    ShowUserProfile(
                                        userModel: userprovider.eventhost));
                              },
                              child: CustomText(
                                text: event.heldby,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: CustomText(
                                text: event.heldbySociety,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ))
                  ],
                )),
          ),
          Stack(
            children: [
              // SpinKitFadingCircle(
              //     itemBuilder: (BuildContext context, int index) {
              //   return DecoratedBox(
              //       decoration: BoxDecoration(
              //     color: index.isEven ? Colors.red : Colors.green,
              //   ));
              // }),
              Container(
                height: height * 0.33,
                width: width * 0.95,
                child: Card(
                  elevation: 2,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Stack(
                        children: [
                          Loading(),
                          GestureDetector(
                            onTap: () async {
                              await societyProvider.getSocietybyid(
                                  id: event.hostsocietyid);
                              print("Printing Event hostid\n\n\n");
                              print(event.hostsocietyid);
                              await userprovider.getuserbyid(id: event.hostid);

                              if (userprovider.isvar) {
                                await userprovider.getVarifiedUser(
                                    email: useremail);
                              }

                              changeScreen(
                                  context,
                                  EventDetails(
                                    event: event,
                                    eventhost: userprovider.eventhost,
                                    user: userprovider.varifiedUser,
                                    eventhostSociety:
                                        societyProvider.eventhostsociety,
                                  ));
                            },
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: this.event.image,
                              //height: 200,
                              fit: BoxFit.fill,
                              // width: double.infinity,

                              height: height * 0.33,
                              width: width * 0.95,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                child: Container(
                  height: height * 0.04,
                  width: width * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.black),
                  child: Center(
                    child: CustomText(
                      text: "Online",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 145, 0, 0),
                child: Container(
                    height: height * 0.09,
                    width: width * 0.55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.calendar_today,
                            size: 30,

                            //  FadeInImage.memoryNetwork(
                            //   placeholder: kTransparentImage,
                            //   image: event.image,
                            //   // height: 200,
                            //   fit: BoxFit.fill,
                            //   // width: double.infinity,
                            // ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomText(
                            text: event.date +
                                "\n" +
                                "From " +
                                event.startime +
                                " to " +
                                event.endtime,
                            size: 14,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
          CustomText(
            text: event.name,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.33),
            child: Row(
              children: [
                Icon(Icons.fmd_good_rounded),
                CustomText(
                  text: event.location,
                  fontWeight: FontWeight.w500,
                  size: 13,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
