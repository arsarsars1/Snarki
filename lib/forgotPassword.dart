import 'package:flutter/material.dart';
import 'package:snarki/common.dart';

class ForgotPassword extends StatefulWidget {
  bool value;

  ForgotPassword({
   @required this.value,
  });

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text(
          widget.value?'Forgot Password':'Rest Password',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            color: text,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: widget.value?120:20,
          right: 20,
          left: 20,
        ),
        child: Form(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 10,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 40,
                    right: 6,
                    left: 6,
                  ),
                  child: Text(
                    widget.value?'Enter your email and we will send you a link to reset your password':'',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: text,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 6.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: widget.value?'Email':'Current Password',
                      prefixIcon: Icon(
                        widget.value?Icons.email:Icons.security,
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
                widget.value?Container():Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 6.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      prefixIcon: Icon(
                        Icons.security,
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
                widget.value?Container():Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 6.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Repeat Password',
                      prefixIcon: Icon(
                        Icons.security,
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
                    top: 30.0,
                  ),
                  child: RaisedButton(
                    onPressed: () {
                      _key.currentState.showSnackBar(SnackBar(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        backgroundColor: text.withOpacity(
                          0.9,
                        ),
                        content: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 8.0,
                              ),
                              child: Icon(
                               widget.value? Icons.mail:Icons.security,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                widget.value?'Email Sent!':'Your password has been changed successfully!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    color: text,
                    child: Text(
                      widget.value?'Recover Password':'Change Password',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.8,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
