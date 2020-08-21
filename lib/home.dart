import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:snarki/common.dart';
import 'package:snarki/friendList.dart';
import 'package:snarki/images.dart';
import 'package:snarki/profile.dart';
import 'package:snarki/result.dart';

enum Selection { Yum, No, Ready, DontCare }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  CardController controller;
  Selection selection = Selection.Yum;
  List<ImageModel> selected = <ImageModel>[];
  List<String> welcomeImages = [
    "assets/food1.jpeg",
    "assets/food2.jpeg",
    "assets/food3.jpeg",
    "assets/food4.jpeg",
    "assets/food5.jpeg",
    "assets/food6.jpeg",
    "assets/food7.jpeg",
    "assets/food8.jpeg",
    "assets/food9.jpeg",
    "assets/food10.jpeg",
    "assets/food11.jpeg",
    "assets/food12.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 3.0,
          left: 8,
          right: 8,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.people_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FriendList(
                              value: false,
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                        ),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.elliptical(
                                10,
                                10,
                              ),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/profile.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Are you in the mood to eat following?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: text,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: TinderSwapCard(
                orientation: AmassOrientation.TOP,
                totalNum: 11,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: 450,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: 400,
                cardBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: ListView(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                '${image[index].image}',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Positioned(
                              bottom: 1,
//                                right: MediaQuery.of(context).size.width / 1.5,
                              child: Container(
                                color:text,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    image[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.8,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: text,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 4.0,
                                  bottom: 4,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(right: 4.0),
                                        child: RaisedButton(
                                          onPressed: () {
                                            if (image[index].isSelectedBtn1) {
                                              setState(() {
                                                image[index].isSelectedBtn1 =
                                                false;
                                                image[index].isSelectedBtn2 =
                                                false;
                                              });
                                            } else {
                                              setState(() {
                                                image[index].isSelectedBtn1 =
                                                true;
                                                image[index].isSelectedBtn2 =
                                                false;
                                              });
                                            }
                                            selectionFunction(image[index]);
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                              10.0,
                                            ),
                                            side: BorderSide(
                                              color:
                                              image[index].isSelectedBtn1
                                                  ? Colors.white
                                                  : Colors.transparent,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 15,
                                          ),
                                          color: image[index].isSelectedBtn1
                                              ? text
                                              : Colors.transparent,
                                          child: Text(
                                            image[index].btn1,
                                            style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1.8,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 4.0),
                                        child: RaisedButton(
                                          onPressed: () {
                                            if (image[index].isSelectedBtn2) {
                                              setState(() {
                                                image[index].isSelectedBtn1 =
                                                false;
                                                image[index].isSelectedBtn2 =
                                                false;
                                              });
                                            } else {
                                              setState(() {
                                                image[index].isSelectedBtn1 =
                                                false;
                                                image[index].isSelectedBtn2 =
                                                true;
                                              });
                                            }
                                            selectionFunction(image[index]);
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                              10.0,
                                            ),
                                            side: BorderSide(
                                              color:
                                              image[index].isSelectedBtn2
                                                  ? Colors.white
                                                  : Colors.transparent,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 15,
                                          ),
                                          color: image[index].isSelectedBtn2
                                              ? text
                                              : Colors.transparent,
                                          child: Text(
                                            image[index].btn2,
                                            style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1.8,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        color: text,
                        child: Text(
                          'See Result',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: RaisedButton(
                        onPressed: () {
                          controller.triggerLeft();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        color: text,
                        child: Text(
                          "Don't Care",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 3.0,
          bottom: 5,
          right: 5,
          left: 5,
        ),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FriendList(
                  value: true,
                ),
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

  selectionFunction(ImageModel image) {
    controller.triggerLeft();
    if (selected.contains(image)) {
      setState(() {
        selected.remove(image);
      });
    } else {
      setState(() {
        selected.insert(0, image);
      });
    }
  }
}
