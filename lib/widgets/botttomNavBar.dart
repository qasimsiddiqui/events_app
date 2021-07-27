import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int active;
  BottomNavBar({required this.active});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 45,
      color: Colors.grey,
      backgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 250),
      animationCurve: Curves.decelerate,
      index: widget.active,
      items: <Widget>[
        //  Icon(Icons.arrow_back, size: 30, color: Colors.black),
        Icon(Icons.account_box, size: 30, color: Colors.black),
        Icon(Icons.home, size: 30, color: Colors.black),
        //  Icon(Icons.shop, size: 30, color: Colors.black),
        Icon(Icons.settings, size: 30, color: Colors.black),
      ],
      onTap: (index) {
        // if (index == widget.active) return;
        // if (index == 3) {
        //   //  ChangeScreen(context, ShoppingBag());
        //   initState();
        // }
        // if (index == 2) {
        //   //   ChangeScreen(context, Home());
        //   initState();
        //}
      },
    );
  }
}
