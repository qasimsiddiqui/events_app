import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.black87,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Login',
                    style: GoogleFonts.merriweather()
                        .copyWith(color: Colors.white, fontSize: 30)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: Icon(Icons.visibility_outlined),
                        border: OutlineInputBorder()),
                    validator: (value) =>
                        isEmail(value!) ? null : "Please enter a valid email",
                  ),
                  SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.black87),
                        onPressed: () {},
                        child: Text('Login')),
                  ),
                  Divider(),
                  SizedBox(
                      height: 40,
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black87),
                          onPressed: () {},
                          child: Text('Login Gmail'))),
                  SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.black87),
                        onPressed: () {},
                        child: Text('Login FaceBook')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?'),
                      TextButton(onPressed: () {}, child: Text('SignUp'))
                    ],
                  ),
                  Text('Forgot Password')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
