import 'package:flutter/material.dart';

const double sm = 8.0;
const double md = 16.0;
const double lg = 32.0;

const smEdge = EdgeInsets.all(8.0);
const mdEdge = EdgeInsets.all(16.0);
const lgEdge = EdgeInsets.all(32.0);

const TextStyle labelTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

InputDecoration buildInputDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: const TextStyle(
      fontSize: 18,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
