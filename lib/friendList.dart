import 'package:flutter/material.dart';
import 'package:snarki/common.dart';
import 'package:snarki/friend.dart';

class FriendList extends StatefulWidget {
  bool value;

  FriendList({
    @required this.value,
  });

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final _key = GlobalKey<ScaffoldState>();
  List<Model> friendSelected = <Model>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text(
          'Friends',
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
          right: 8.0,
          left: 8.0,
          top: 3,
        ),
        child: ListView(
          children: [
            searchbar(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: friend.length,
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
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 4.0,
                        bottom: 4,
                      ),
                      child: display(friend[index]),
                    ),
                  ),
                );
              },
            ),
            bottom(),
          ],
        ),
      ),
//      bottomNavigationBar: bottom(),
    );
  }

  saveFriend(bool isSelected, Model friend) {
    if (isSelected == true) {
      setState(() {
        friendSelected.add(friend);
      });
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
                Icons.group_add,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Text(
                friend.name + ' is added!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ));
    } else {
      setState(() {
        friendSelected.remove(friend);
      });
    }
  }

  searchbar() {
    if (widget.value) {
      return Container();
    } else {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search someone on Snarki',
              prefixIcon: Icon(
                Icons.search,
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
      );
    }
  }

  bottom() {
    if (widget.value) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 3.0,
              bottom: 5,
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
                          Icons.share,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Result shared!',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
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
                'Send Result',
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
      );
    } else {
      return Container(
      );
    }
  }

  display(Model friend) {
    if (widget.value) {
      return CheckboxListTile(
        title: new Text(
          friend.name,
          style: TextStyle(
            color: text,
          ),
        ),
        secondary: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              20,
            ),
            child: Image.asset(
              friend.pic,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        value: friendSelected.contains(friend),
        activeColor: text,
        checkColor: Colors.black,
        onChanged: (bool isSelected) {
          saveFriend(isSelected, friend);
        },
      );
    } else {
      return Container(
        child: ListTile(
          title: new Text(
            friend.name,
            style: TextStyle(
              color: text,
            ),
          ),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Image.asset(
                friend.pic,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }
  }
}
