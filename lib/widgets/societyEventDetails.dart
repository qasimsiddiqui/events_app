import 'package:events_app/providers/eventProvider.dart';
import 'package:events_app/widgets/customtext.dart';
import 'package:events_app/widgets/eventFeed_widget.dart';
import 'package:events_app/widgets/eventSummaryCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocietyEventDetails extends StatefulWidget {
  final String email;
  const SocietyEventDetails({Key? key, required this.email}) : super(key: key);

  @override
  _SocietyEventDetailsState createState() => _SocietyEventDetailsState();
}

class _SocietyEventDetailsState extends State<SocietyEventDetails> {
  bool showpastEvents = false;
  bool showtopEvents = false;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final eventProvider = Provider.of<EventProvider>(context);
    return Column(
      children: [
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
                color: showtopEvents
                    ? Colors.white
                    : showpastEvents
                        ? Colors.white
                        : Colors.grey.shade300,
                elevation: showtopEvents
                    ? 2
                    : showpastEvents
                        ? 2
                        : 0,
                child: FlatButton(
                    autofocus: false,
                    onPressed: () {
                      setState(() {
                        showpastEvents = false;
                        showtopEvents = false;
                      });
                    },
                    child: Text("Upcoming")),
              ),
              Card(
                elevation: showtopEvents
                    ? 2
                    : showpastEvents
                        ? 0
                        : 2,
                color: showtopEvents
                    ? Colors.white
                    : showpastEvents
                        ? Colors.grey.shade300
                        : Colors.white,
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        showpastEvents = true;
                        showtopEvents = false;
                      });
                    },
                    child: Text("Past")),
              ),
              Card(
                elevation: showtopEvents ? 0 : 2,
                color: showtopEvents ? Colors.grey.shade300 : Colors.white,
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        showpastEvents = true;
                        print(showpastEvents);
                      });
                    },
                    child: Text("Top")),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 2,
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: eventProvider.events
              .map((item) => GestureDetector(
                    onTap: () {},
                    child: EventFeed(
                      event: item,
                      useremail: widget.email,
                      showhostsoc: false,
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
