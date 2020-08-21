import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snarki/forgotPassword.dart';
import 'package:snarki/home.dart';
import 'package:snarki/signup.dart';

import 'common.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 150,
            right: 20,
            left: 20,
          ),
          child: ListView(
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  color: text,
                  fontSize: 25,
                ),
              ),
              Text(
                'Snarki',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: text,
                  fontSize: 35,
                ),
              ),
              Form(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 6.0,
                          bottom: 6.0,
                        ),
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: text,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10.0,
                              ),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 6.0,
                          bottom: 6.0,
                        ),
                        child: TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: text,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10.0,
                              ),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 45,
                                vertical: 15,
                              ),
                              color: text,
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassword(value: true,),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot?',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 50,),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Sign up',
                          style: TextStyle(
                            color: text,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
