import 'package:events_app/providers/eventProvider.dart';
import 'package:events_app/providers/societyProvider.dart';
import 'package:events_app/providers/userProvider.dart';
import 'package:events_app/screens/create_event.dart';
import 'package:events_app/screens/create_society.dart';
import 'package:events_app/screens/homePage.dart';
import 'package:events_app/screens/society_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialze()),
        ChangeNotifierProvider.value(value: EventProvider.initialize()),
        ChangeNotifierProvider.value(value: SocietyProvider.initialize())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        buttonColor: Colors.white,
      ),
      home: SocietyDetails(),
    );
  }
}
