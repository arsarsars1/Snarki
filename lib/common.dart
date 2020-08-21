import 'package:flutter/material.dart';

//final appColor = HexColor('557566');
final background = HexColor('5D5B6A');
final text = HexColor('CFB495');
final accent = HexColor('758184');
final needed = HexColor('F5CDAA');

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}