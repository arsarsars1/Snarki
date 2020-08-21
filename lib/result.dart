import 'package:flutter/material.dart';
import 'package:snarki/common.dart';
import 'package:snarki/friend.dart';
import 'package:snarki/friendList.dart';
import 'package:snarki/map.dart';

enum ResultSelection { Yes, No }

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final _key = GlobalKey<ScaffoldState>();
  ResultSelection resultSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text(
          'Result',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            color: text,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 3,
        ),
        child: ListView(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: restaurant.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      border: Border.all(color: Colors.white,width: 2,),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(
                          top: 4.0,
                          bottom: 4,
                        ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapDisplay(
                                map: restaurant[index].map,
                              ),
                            ),
                          );
                        },
                        title: new Text(
                          restaurant[index].name,
                          style: TextStyle(
                            color: text,
                          ),
                        ),
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                            border: Border.all(color: Colors.black,width: 2,),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),

                            child: Image.asset(
                              restaurant[index].pic,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        trailing: Text(restaurant[index].km,
                          style: TextStyle(
                            color: text,
                          ),),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 3.0,
          bottom: 5,
        ),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FriendList(value: true,),
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            side: BorderSide(
              color: Colors.white,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          color: Colors.transparent,
          child: Text(
            'Send Result to Friends',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.8,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
