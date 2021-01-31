import 'package:flutter/material.dart';

Widget appBar(String text) {
  return AppBar(
    leading: Icon(
      Icons.local_pharmacy,
      color: Colors.red,
      size: 40,
    ),
    title: Text(text),
  );
}
