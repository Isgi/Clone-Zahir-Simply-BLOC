import 'package:flutter/material.dart';

LinearGradient primaryGradient = new LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  stops: [0.1, 0.5, 1.0],
  colors: [
    Colors.blue[600],
    Colors.blue[500],
    Colors.blue[300],
  ],
);