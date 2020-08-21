import 'package:flutter/material.dart';

class MapDisplay extends StatefulWidget {
  String map;

  MapDisplay({this.map,});

  @override
  _MapDisplayState createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InteractiveViewer(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            20,
          ),
          child: Image.asset(
            widget.map,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
