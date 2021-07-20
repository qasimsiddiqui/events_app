import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Colors.black87,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('Register',
                        style: GoogleFonts.merriweather()
                            .copyWith(color: Colors.white, fontSize: 30)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Name',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Username',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder()),
                        validator: (value) => isEmail(value!)
                            ? null
                            : "Please enter a valid email",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            suffixIcon: Icon(Icons.visibility_outlined),
                            border: OutlineInputBorder()),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black87),
                          onPressed: () {},
                          child: Text('Register')),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
